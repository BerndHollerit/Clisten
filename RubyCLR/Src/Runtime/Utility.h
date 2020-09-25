#pragma once

namespace RubyClr {
  public delegate VALUE RubyMethod(int argc, VALUE *args, VALUE self);

  ref class VariableDictionary : Dictionary<String^, LocalBuilder^> {};

  ref class LabelDictionary : Dictionary<String^, System::Reflection::Emit::Label> {
  public:
    System::Reflection::Emit::Label GetOrCreateLabel(ILGenerator^ g, VALUE label_name) {
      System::Reflection::Emit::Label label;
      String^ labelName = Marshal::ToClrString(label_name);
      if (!ContainsKey(labelName)) {
        label = g->DefineLabel();
        this[labelName] = label;
      }
      else
        label = this[labelName];
      return label;
    }
  };

  // TODO: Note that this is totally un-optimized. Need to converge on a tree to optimize # tests.
  public ref class RuntimeResolver {
    static Type^ MapRubyTypeToDotNetType(VALUE object) {
      if (object == Qtrue || object == Qfalse)      return bool::typeid;
      if (TYPE(object) == T_STRING)                 return String::typeid;
      if (FIXNUM_P(object))                         return Int32::typeid;
      if (rb_obj_is_kind_of(object, rb_cNumeric))   return Single::typeid; // TODO: make this do single and double somehow ...

      VALUE klass        = rb_class_of(object);
      VALUE class_object = rb_iv_get(klass, "@clr_type");
      return (Type^)Marshal::ToObject(class_object);
    }

    static array<Type^>^ GetParameterTypes(int argc, VALUE *args) {
      array<Type^>^ sig = gcnew array<Type^>(argc);
      for (int i = 0; i < argc; ++i)
        sig[i] = MapRubyTypeToDotNetType(args[i]);
      return sig;
    }

    static bool IsExactMatch(array<Type^>^ rubyParameterTypes, array<Type^>^ methodParameterTypes) {
      if (rubyParameterTypes->Length != methodParameterTypes->Length) return false;
      for (int i = 0; i < rubyParameterTypes->Length; ++i) {
        if (rubyParameterTypes[i] == Single::typeid) {
          if (!(methodParameterTypes[i] == Single::typeid) && !(methodParameterTypes[i] == Double::typeid)) return false;
        }
        else
          if (rubyParameterTypes[i] != methodParameterTypes[i]) return false;
      }
      return true;
    }

    static bool IsMatchParameterArray(array<Type^>^ rubyParameterTypes, array<Type^>^ methodSignatureTypes) {
      Type^ parameterArrayType = methodSignatureTypes[methodSignatureTypes->Length - 1]->GetElementType();
      for (int i = 0; i < rubyParameterTypes->Length; ++i) {
        Type^ lhs = rubyParameterTypes[i];
        if (i < methodSignatureTypes->Length - 1) {
          Type^ rhs = methodSignatureTypes[i];
          if (!(lhs == rhs) && !lhs->IsSubclassOf(rhs)) return false;
        }
        else
          if (!(lhs == parameterArrayType) && !lhs->IsSubclassOf(parameterArrayType)) return false;
      }
      return true;
    }

    // TODO: will eventually have to deal with generics overloads as well
    static int FindBestMatch(array<Type^>^ rubyParameterTypes, array<array<Type^>^>^ methodSignatures, array<bool>^ isParameterArray) {
      int length = rubyParameterTypes->Length;
      for (int i = 0; i < methodSignatures->Length; ++i) {
        array<Type^>^ methodSignature = methodSignatures[i];
        //if (methodSignature->Length <= rubyParameterTypes->Length
        //    && isParameterArray[i] 
        //    && IsMatchParameterArray(rubyParameterTypes, methodSignature)) return i;

        if (length == methodSignature->Length) {
          bool found = true;
          for (int j = 0; j < length; ++j) { 
            Type^ lhs = rubyParameterTypes[j];
            Type^ rhs = methodSignature[j];
            if (lhs != rhs && !lhs->IsSubclassOf(rhs)) {
              found = false;
              break;
            }
          }
          if (found) return i;
        }
      }
      return -1;
    }

    static int FindExactMatch(array<Type^>^ rubyParameterTypes, array<array<Type^>^>^ methodSignatures) {
      for (int i = 0; i < methodSignatures->Length; ++i)
        if (IsExactMatch(rubyParameterTypes, methodSignatures[i])) return i;
      return -1;
    }

  public:
    static int GetMethodTableIndex(int methodId, int argc, VALUE *args) {
      MemberRef^ methodRef         = MetadataCache::Item[methodId];      
      array<Type^>^ parameterTypes = GetParameterTypes(argc, args);
      int result                   = FindExactMatch(parameterTypes, methodRef->MethodTable);
      return result == -1 ? FindBestMatch(parameterTypes, methodRef->MethodTable, nullptr) : result;
    }
  };
}