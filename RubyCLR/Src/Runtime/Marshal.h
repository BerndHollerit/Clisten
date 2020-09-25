#pragma once

namespace RubyClr {
  extern "C" {
    void release_object(void *objref) {
      if (objref != 0 && *((int*)objref) != 0) {
        int *objectReference = (int*)objref;
        ((GCHandle)(IntPtr)*objectReference).Free();
        xfree(objectReference);
      }
    }

    VALUE alloc_clr_object(VALUE klass) {
      if (rb_iv_get(klass, "@is_value_type") == Qtrue) {
        int valueTypeSize   = FIX2LONG(rb_iv_get(klass, "@value_type_size"));
        void *valueTypeBlob = ruby_xmalloc(valueTypeSize);
        return Data_Wrap_Struct(klass, 0, 0, valueTypeBlob);
      }
      else {
        int *objectReference = ALLOC(int);
        *objectReference     = 0;
        return Data_Wrap_Struct(klass, 0, release_object, objectReference);
      }
    }
  }

  public ref class Marshal {
    // Required to shut up compiler for my usage within a C method - bug reported to MSFT - to see bug comment out next line
    static List<Delegate^>^ DelegateReferences = gcnew List<Delegate^>();

  public:
    static VALUE GetRubyClassObject(String^ rubyClassName) {
      // Whoa - this is a different cache - this lets me avoid doing a lookup using eval() - clearly this is useful?!
      if (Marshal::TypeNameToClassObject.ContainsKey(rubyClassName)) 
        return Marshal::TypeNameToClassObject[rubyClassName];
      else 
        return Ruby::EvalString(rubyClassName->Replace(".", "::")->Replace("+", "::"));
    }

    static VALUE GetRubyClassObject(Type^ type) {
      return GetRubyClassObject(Ruby::TypeToRubyShadowClassName(type));
    }

    static Dictionary<String^, VALUE> TypeNameToClassObject = gcnew Dictionary<String^, VALUE>();

    // Custom Ruby allocator functions
    static VALUE AssignToClassInstance(VALUE self, Object^ object) {
      GCHandle objref      = GCHandle::Alloc(object);
      int *objectReference = (int*)DATA_PTR(self);
      *objectReference     = ((IntPtr)objref).ToInt32();
      return Qnil;
    }

    // Conversions TO Ruby
    static VALUE ToRubyString(String^ string) {
      return Ruby::ToRubyString(string);
    }

    // This internal method is used only to wrap CLR objects that we don't want to be 
    // callable from Ruby code.
    static VALUE ToRubyObjectByRefInternal(Object^ object) {
      GCHandle objref      = GCHandle::Alloc(object);
      int *objectReference = ALLOC(int);
      *objectReference     = ((IntPtr)objref).ToInt32();
      return Data_Wrap_Struct(rb_cObject, 0, release_object, objectReference);
    }

    static VALUE ToRubyEnum(String^ enumName, int value) {
      VALUE class_object = GetRubyClassObject(enumName);
      return rb_funcall(class_object, rb_intern("lookup"), 1, Marshal::ToRubyNumber(value));
    }

    static VALUE ToRubyObjectByValue(String^ valueTypeClassName, void *value_type) {
      VALUE class_object = GetRubyClassObject(valueTypeClassName);
      return Data_Wrap_Struct(class_object, 0, 0, value_type);
    }

    static VALUE ToRubyObjectByRef(VALUE class_object, Object^ object) {
      GCHandle objref      = GCHandle::Alloc(object);
      int *objectReference = ALLOC(int);
      *objectReference     = ((IntPtr)objref).ToInt32();
      return Data_Wrap_Struct(class_object, 0, release_object, objectReference);
    }

    static VALUE ToRubyObjectAsInterface(String^ interfaceName, Object^ object) {
      VALUE class_object = GetRubyClassObject(interfaceName);
      return ToRubyObjectByRef(class_object, object);
    }

    static VALUE ToRubyObject(Object^ object) {
      if (object == nullptr) return Qnil;

      Type^ objectType = object->GetType();
      VALUE class_object = GetRubyClassObject(objectType);

      // If an object can be marshaled by value, we do the correct conversion
      if (objectType == Boolean::typeid) return ToRubyBoolean((Boolean)object);
      if (objectType == SByte::typeid)   return ToRubyNumber((SByte)object);
      if (objectType == Int16::typeid)   return ToRubyNumber((Int16)object);
      if (objectType == Int32::typeid)   return ToRubyNumber((Int32)object);
      if (objectType == Int64::typeid)   return ToRubyNumber((Int64)object);
      if (objectType == Byte::typeid)    return ToRubyNumber((Byte)object);
      if (objectType == UInt16::typeid)  return ToRubyNumber((UInt16)object);
      if (objectType == UInt32::typeid)  return ToRubyNumber((UInt32)object);
      if (objectType == UInt64::typeid)  return ToRubyNumber((UInt64)object);
      if (objectType == String::typeid)  return ToRubyString((String^)object);
      if (objectType == Single::typeid)  return ToRubyNumber((Single)object);
      if (objectType == Double::typeid)  return ToRubyNumber((Double)object);      

      return ToRubyObjectByRef(class_object, object);
    }

    static VALUE ToRubyString(Int64 value)   { return ToRubyString(Convert::ToString(value)); }
    static VALUE ToRubyString(Int32 value)   { return ToRubyString(Convert::ToString(value)); }
    static VALUE ToRubyString(Int16 value)   { return ToRubyString(Convert::ToString(value)); }
    static VALUE ToRubyString(SByte value)   { return ToRubyString(Convert::ToString(value)); }

    static VALUE ToRubyString(UInt64 value)  { return ToRubyString(Convert::ToString(value)); }
    static VALUE ToRubyString(UInt32 value)  { return ToRubyString(Convert::ToString(value)); }
    static VALUE ToRubyString(UInt16 value)  { return ToRubyString(Convert::ToString(value)); }
    static VALUE ToRubyString(Byte value)    { return ToRubyString(Convert::ToString(value)); }
    static VALUE ToRubyString(Boolean value) { return ToRubyString(Convert::ToString(value)); }

    static VALUE ToRubyNumber(Int64 value)   { return rb_ll2inum(value); }
    static VALUE ToRubyNumber(Int32 value)   { return rb_int2inum(value); }
    static VALUE ToRubyNumber(Int16 value)   { return rb_int2inum(value); }
    static VALUE ToRubyNumber(SByte value)   { return rb_int2inum(value); }
    
    static VALUE ToRubyNumber(UInt64 value)  { return rb_ull2inum(value); }
    static VALUE ToRubyNumber(UInt32 value)  { return rb_uint2inum(value); }
    static VALUE ToRubyNumber(UInt16 value)  { return rb_uint2inum(value); }
    static VALUE ToRubyNumber(Byte value)    { return rb_uint2inum(value); }

    static VALUE ToRubyNumber(Double value)  { return rb_float_new(value); }
    static VALUE ToRubyNumber(Single value)  { return rb_float_new(value); }

    static VALUE ToRubyBoolean(bool value)   { return value ? Qtrue : Qfalse; }
    static VALUE ToRubyNil()                 { return Qnil; }

    static void ToRubyException(Exception^ e) { rb_raise(rb_eRuntimeError, "%s", e->ToString()); }

    // Conversions FROM Ruby
    static String^ ToClrString(VALUE string) { return gcnew String(RSTRING(string)->ptr); }

    static Boolean ToBoolean(VALUE value) { 
      if (value == Qtrue)  return true;
      if (value == Qfalse) return false;
      rb_raise(rb_eRuntimeError, "Expected a boolean but was passed something else");
    }

    static Int64  ToInt64(VALUE value)  { return rb_num2ll(value); }
    static UInt64 ToUInt64(VALUE value) { return rb_num2ull(value); }

    static Int32  ToInt32(VALUE value)  { return rb_num2long(value); }
    static UInt32 ToUInt32(VALUE value) { return rb_num2ulong(value); }

    static Int16  ToInt16(VALUE value)  { return Convert::ToInt16(ToInt32(value)); }
    static SByte  ToSByte(VALUE value)  { return Convert::ToSByte(ToInt32(value)); }

    static UInt16 ToUInt16(VALUE value) { return Convert::ToInt16(ToUInt32(value)); }
    static Byte   ToByte(VALUE value)   { return Convert::ToByte(ToUInt32(value)); }

    static Double ToDouble(VALUE value) { return Convert::ToDouble(rb_num2dbl(value)); }
    static Single ToSingle(VALUE value) { return Convert::ToSingle(rb_num2dbl(value)); }

    // HACK:: does this actually work with non-integral enums? try with enum: byte?
    // NOTE:: enums can actually be based on floats as well! (CLR lets this happen, languages don't)
    static int ToEnum(VALUE value) {
      return Marshal::ToInt32(rb_iv_get(value, "@value"));
    }

    static Object^ ToObject(VALUE object) {
      // If a type that can be marshaled by value, then we convert and marshal
      if (object == Qtrue || object == Qfalse)    return object == Qtrue;
      if (TYPE(object) == T_STRING)               return ToClrString(object);
      if (FIXNUM_P(object))                       return ToInt32(object);
      if (rb_obj_is_kind_of(object, rb_cNumeric)) return ToDouble(object);

      // Object is a marshal by reference only type 
      if (object == Qnil) return nullptr;
      int *objectReference;
      Data_Get_Struct(object, int, objectReference);
      return ((GCHandle)(IntPtr)*objectReference).Target;
    }
  };
}