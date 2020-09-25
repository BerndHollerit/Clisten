#pragma once

VALUE g_module;

// TODO: Do a pass through this code and look for all Ruby-facing methods that could have null exception errors and
// return a Ruby exception to avoid crashing the Ruby interpreter.
namespace RubyClr {
  extern "C" {
    VALUE create_dynamic_method(VALUE self, VALUE method_name, VALUE return_type, VALUE method_parameters) {
      String^ methodName       = method_name == Qnil ? String::Empty : Marshal::ToClrString(method_name);
      String^ returnType       = Marshal::ToClrString(return_type);
      String^ methodParameters = Marshal::ToClrString(method_parameters);
      return Reflector::CreateDynamicMethod(methodName, returnType, methodParameters);
    }

    VALUE create_event_dynamic_method(VALUE self, VALUE object, VALUE event_name, VALUE is_static) {
      Type^ type        = is_static == Qtrue ? (Type^)Marshal::ToObject(object) : (Type^)Marshal::ToObject(object)->GetType();
      String^ eventName = Marshal::ToClrString(event_name);
      return Reflector::CreateEventDynamicMethod(type, eventName);
    }

    VALUE get_cil_generator(VALUE self, VALUE dynamic_method) {
      DynamicMethod^ method = (DynamicMethod^)Marshal::ToObject(dynamic_method);
      return Marshal::ToRubyObjectByRefInternal(method->GetILGenerator());
    }

    Type^ find_type(VALUE self, VALUE type_name) {
      String^ typeName      = Marshal::ToClrString(type_name);
      ArrayList^ namespaces = self == Qnil ? nullptr : (ArrayList^)Marshal::ToObject(rb_funcall(self, rb_intern("namespaces"), 0));
      Type^ type            = Reflector::FindType(typeName, namespaces);
      if (type == nullptr) rb_raise(rb_eRuntimeError, "Could not find type: %s", STR2CSTR(type_name));
      return type;
    }

    ILGenerator^ get_generator(VALUE self) {
      return (ILGenerator^)Marshal::ToObject(rb_funcall(self, rb_intern("generator"), 0));
    }

    LabelDictionary^ get_labels(VALUE self) {
      return (LabelDictionary^)Marshal::ToObject(rb_funcall(self, rb_intern("labels"), 0));
    }

    VariableDictionary^ get_variables(VALUE self) {
      return (VariableDictionary^)Marshal::ToObject(rb_funcall(self, rb_intern("variables"), 0));
    }

    ArrayList^ get_namespaces(VALUE self) {
      if (self == Qnil) return nullptr;
      return (ArrayList^)Marshal::ToObject(rb_funcall(self, rb_intern("namespaces"), 0));
    }

    VALUE create_label_dictionary(VALUE self) {
      return Marshal::ToRubyObjectByRefInternal(gcnew LabelDictionary());
    }

    VALUE create_variable_dictionary(VALUE self) {
      return Marshal::ToRubyObjectByRefInternal(gcnew VariableDictionary());
    }

    VALUE create_namespace_list(VALUE self) {
      ArrayList^ namespaces = gcnew ArrayList();
      namespaces->Add("System");
      namespaces->Add("RubyClr");
      return Marshal::ToRubyObjectByRefInternal(namespaces);
    }

    VALUE is_value_type(VALUE self, VALUE type_name) {
      Type^ type = find_type(self, type_name);
      return type->IsValueType ? Qtrue : Qfalse;
    }

    VALUE is_enum(VALUE self, VALUE type_name) {
      Type^ type = find_type(self, type_name);
      return type->IsEnum ? Qtrue : Qfalse;
    }

    VALUE emit(VALUE self, VALUE op_code) {
      (gcnew Generator(self))->Emit(op_code);
      return Qnil;
    }

    VALUE emit_method_ref(VALUE self, VALUE op_code, VALUE is_static, VALUE type_name, VALUE method_name, VALUE method_types, VALUE method_parameters) {
      (gcnew Generator(self))->EmitMethodRef(op_code, is_static, type_name, method_name, method_types, method_parameters);
      return Qnil;
    }

    VALUE emit_ctor_ref(VALUE self, VALUE op_code, VALUE type_name, VALUE ctor_parameters) {
      (gcnew Generator(self))->EmitConstructorRef(op_code, type_name, ctor_parameters);
      return Qnil;
    }

    VALUE emit_field_ref(VALUE self, VALUE op_code, VALUE is_static, VALUE type_name, VALUE field_name) {
      (gcnew Generator(self))->EmitFieldRef(op_code, is_static, type_name, field_name);
      return Qnil;
    }

    VALUE emit_type_ref(VALUE self, VALUE op_code, VALUE type_name) {
      get_generator(self)->Emit(Reflector::GetOpCode(op_code), find_type(self, type_name));
      return Qnil;
    }

    VALUE emit_string(VALUE self, VALUE op_code, VALUE string) {
      get_generator(self)->Emit(Reflector::GetOpCode(op_code), Marshal::ToClrString(string));
      return Qnil;
    }

    VALUE emit_label(VALUE self, VALUE op_code, VALUE label_name) {
      ILGenerator^ g = get_generator(self);
      System::Reflection::Emit::Label label = get_labels(self)->GetOrCreateLabel(g, label_name);
      g->Emit(Reflector::GetOpCode(op_code), label);
      return Qnil;
    }

    VALUE emit_int64(VALUE self, VALUE op_code, VALUE number) {
      get_generator(self)->Emit(Reflector::GetOpCode(op_code), rb_num2ll(number));
      return Qnil;
    }

    VALUE emit_int32(VALUE self, VALUE op_code, VALUE number) {
      get_generator(self)->Emit(Reflector::GetOpCode(op_code), rb_num2long(number));
      return Qnil;
    }

    VALUE emit_int16(VALUE self, VALUE op_code, VALUE number) {
      get_generator(self)->Emit(Reflector::GetOpCode(op_code), (Int16)rb_num2long(number));
      return Qnil;
    }

    VALUE emit_int8(VALUE self, VALUE op_code, VALUE number) {
      get_generator(self)->Emit(Reflector::GetOpCode(op_code), (SByte)rb_num2long(number));
      return Qnil;
    }

    VALUE emit_uint8(VALUE self, VALUE op_code, VALUE number) {
      get_generator(self)->Emit(Reflector::GetOpCode(op_code), (Byte)rb_num2ulong(number));
      return Qnil;
    }

    VALUE emit_double(VALUE self, VALUE op_code, VALUE number) {
      get_generator(self)->Emit(Reflector::GetOpCode(op_code), NUM2DBL(number));
      return Qnil;
    }

    VALUE emit_local_variable_reference(VALUE self, VALUE op_code, VALUE variable_name) {
      VariableDictionary^ d = get_variables(self);
      LocalBuilder^ variable = d[Marshal::ToClrString(variable_name)];
      get_generator(self)->Emit(Reflector::GetOpCode(op_code), variable);
      return Qnil;
    }

    VALUE emit_switch_statement(VALUE self, VALUE label_symbols) {
      int length           = RARRAY(label_symbols)->len;
      array<System::Reflection::Emit::Label>^ labels = gcnew array<System::Reflection::Emit::Label>(length);
      LabelDictionary^ d   = get_labels(self);
      ILGenerator^ g       = get_generator(self);

      for(int i = 0; i < length; ++i) {
        VALUE symbol     = rb_ary_entry(label_symbols, i);
        VALUE label_name = rb_funcall(symbol, rb_intern("to_s"), 0);
        labels[i]        = d->GetOrCreateLabel(g, label_name);
      }
      g->Emit(OpCodes::Switch, labels);
      return Qnil;
    }

    VALUE label(VALUE self, VALUE label_name) {
      ILGenerator^ g = get_generator(self);
      VALUE label_name_string = rb_funcall(label_name, rb_intern("to_s"), 0);
      System::Reflection::Emit::Label label = get_labels(self)->GetOrCreateLabel(g, label_name_string);
      g->MarkLabel(label);
      return Qnil;
    }

    void *get_ruby_function_pointer(VALUE klass, VALUE dynamic_method) {
      DynamicMethod^ method     = (DynamicMethod^)Marshal::ToObject(dynamic_method);
      RubyMethod^ rubyMethod    = (RubyMethod^)method->CreateDelegate(RubyMethod::typeid);
      List<Delegate^>^ shimRefs = (List<Delegate^>^)Marshal::ToObject(rb_iv_get(klass, "@shim_refs"));
      if (shimRefs == nullptr) {
        shimRefs        = gcnew List<Delegate^>();
        VALUE shim_refs = Marshal::ToRubyObjectByRefInternal(shimRefs);
        rb_iv_set(klass, "@shim_refs", shim_refs);
      }
      shimRefs->Add(rubyMethod);
      return (void*)System::Runtime::InteropServices::Marshal::GetFunctionPointerForDelegate(rubyMethod);
    }

    VALUE define_ruby_method(VALUE self, VALUE classmod, VALUE dynamic_method, VALUE method_name) {
      rb_define_method(classmod, StringValueCStr(method_name), RUBY_METHOD_FUNC(get_ruby_function_pointer(classmod, dynamic_method)), -1);
      return Qnil;
    }

    VALUE define_ruby_module_function(VALUE self, VALUE module, VALUE dynamic_method, VALUE method_name) {
      rb_define_module_function(module, StringValueCStr(method_name), RUBY_METHOD_FUNC(get_ruby_function_pointer(module, dynamic_method)), -1);
      return Qnil;
    }

    VALUE define_ruby_singleton_method(VALUE self, VALUE classmod, VALUE dynamic_method, VALUE method_name) {
      rb_define_singleton_method(classmod, StringValueCStr(method_name), RUBY_METHOD_FUNC(get_ruby_function_pointer(classmod, dynamic_method)), -1);
      return Qnil;
    }

    VALUE define_event_method(VALUE self, VALUE object, VALUE dynamic_method, VALUE event_name, VALUE is_static) {
      Type^ type                   = is_static == Qtrue ? (Type^)Marshal::ToObject(object) : (Type^)Marshal::ToObject(object)->GetType();
      DynamicMethod^ dynamicMethod = (DynamicMethod^)Marshal::ToObject(dynamic_method);
      Object^ target               = is_static == Qtrue ? nullptr : Marshal::ToObject(object);
      String^ eventName            = Marshal::ToClrString(event_name);
      return Reflector::DefineDynamicMethod(type, dynamicMethod, eventName, target);
    }

    VALUE append_namespaces(VALUE self, VALUE namespaces) {
      array<String^>^ namespace_vector = Marshal::ToClrString(namespaces)->Split(',');
      get_namespaces(self)->AddRange(namespace_vector);     
      return Qnil;
    }

    VALUE declare(VALUE self, VALUE type_name, VALUE variable_symbol) {
      LocalBuilder^ variable = get_generator(self)->DeclareLocal(find_type(self, type_name));
      VALUE variable_name = rb_funcall(variable_symbol, rb_intern("to_s"), 0);
      String^ name = Marshal::ToClrString(variable_name);
      get_variables(self)->Add(name, variable);
      return Qnil;
    }

    VALUE begin_exception_block(VALUE self) {
      get_generator(self)->BeginExceptionBlock();
      return Qnil;
    }

    VALUE begin_catch_block(VALUE self, VALUE type_name) {
      get_generator(self)->BeginCatchBlock(find_type(self, type_name));
      return Qnil;
    }
    
    VALUE end_exception_block(VALUE self) {
      get_generator(self)->EndExceptionBlock();
      return Qnil;
    }

    VALUE ld_block(VALUE self, VALUE block) {
      get_generator(self)->Emit(OpCodes::Ldc_I4, (int)block);
      return Qnil;
    }

    VALUE intern(VALUE self, VALUE string) {
      get_generator(self)->Emit(OpCodes::Ldc_I4, (int)rb_intern(StringValueCStr(string)));
      return Qnil;
    }

    VALUE call_ruby_varargs(VALUE self, VALUE method_name, VALUE parameter_count) {
      Module^ module             = Assembly::GetExecutingAssembly()->GetModules()[0];
      MethodInfo^ method         = module->GetMethod(Marshal::ToClrString(method_name));
      int parameterCount         = Marshal::ToInt32(parameter_count);
      array<Type^>^ varargsTypes = gcnew array<Type^>(parameterCount);
      for (int i = 0; i < parameterCount; ++i)
        varargsTypes[i] = System::UInt32::typeid;
      get_generator(self)->EmitCall(OpCodes::Call, method, varargsTypes);
      return Qnil;
    }

    VALUE call_ruby(VALUE self, VALUE method_name) {
      Module^ module     = Assembly::GetExecutingAssembly()->GetModules()[0];
      MethodInfo^ method = module->GetMethod(Marshal::ToClrString(method_name));
      get_generator(self)->Emit(OpCodes::Call, method);
      return Qnil;
    }

    VALUE clone_value_type(VALUE self) {
      VALUE clone       = rb_obj_clone(self);
      VALUE klass       = rb_class_of(self);
      int valueTypeSize = FIX2LONG(rb_iv_get(klass, "@value_type_size"));

      void *cloneData   = ruby_xmalloc(valueTypeSize);
      memcpy(cloneData, DATA_PTR(self), valueTypeSize);
      DATA_PTR(clone)   = cloneData;

      return clone;
    }

    Type^ get_icomparable_of_t(Type^ type) {
      array<Assembly^>^ assemblies = AppDomain::CurrentDomain->GetAssemblies();
      for each (Assembly^ assembly in assemblies) {
        if (assembly->GetName()->Name == "mscorlib"){
          Type^ comparable = assembly->GetType("System.IComparable`1");
          return comparable->MakeGenericType(type);
        }
      }
      throw gcnew Exception("Cannot find IComparable`1 type - corrupt installation?");
    }

    VALUE internal_create_class_object(Type^ type, String^ typeName) {
      VALUE class_object;
      // TODO: think this through -- this is causing major instability in the bridge
      //if (type->BaseType != nullptr) {
      //  String^ baseClassName   = Ruby::TypeToRubyShadowClassName(type->BaseType);
      //  VALUE base_class_object = Ruby::EvalString(baseClassName);
      //  class_object = rb_funcall(rb_cClass, rb_intern("new"), 1, base_class_object);
      //}
      //else
        class_object = rb_funcall(rb_cClass, rb_intern("new"), 0);

      VALUE shim_refs = Marshal::ToRubyObjectByRefInternal(gcnew List<Delegate^>());
      rb_iv_set(class_object, "@shim_refs", shim_refs);

      rb_iv_set(class_object, "@clr_type",      Marshal::ToRubyObjectByRefInternal(type));
      rb_iv_set(class_object, "@is_value_type", type->IsValueType ? Qtrue : Qfalse);
      rb_iv_set(class_object, "@is_enum",       type->IsEnum ? Qtrue : Qfalse);
      rb_iv_set(class_object, "@is_interface",  type->IsInterface ? Qtrue : Qfalse);
      rb_iv_set(class_object, "@is_generic",    type->IsGenericType ? Qtrue : Qfalse);
      rb_iv_set(class_object, "@is_nested",     type->IsNested ? Qtrue : Qfalse);
      rb_iv_set(class_object, "@event_refs",    rb_ary_new());

      if (type->IsValueType) {
        int valueTypeSize = type->IsEnum ? 4 : System::Runtime::InteropServices::Marshal::SizeOf(type);
        rb_iv_set(class_object, "@value_type_size", INT2FIX(valueTypeSize));
        rb_define_method(class_object, "clone", RUBY_METHOD_FUNC(clone_value_type), 0);
      }

      rb_define_alloc_func(class_object, alloc_clr_object);
      
      // TODO: perhaps should move this cache add somewhere else?
      Marshal::TypeNameToClassObject.Add(typeName, class_object);

      rb_funcall(class_object, rb_intern("extend"), 1, rb_const_get(rb_cObject, rb_intern("ClrClassStaticMethods"))); 

      // Can I make this a generic extension thing in the future?
      if (!type->IsInterface) {
        if (System::Collections::IEnumerable::typeid->IsAssignableFrom(type))
          rb_funcall(class_object, rb_intern("include"), 1, rb_const_get(rb_cObject, rb_intern("ClrEnumerator")));

        // TODO: fix the bug with generic interfaces by fixing the way find_type works
        // need to truncate to root of generic interface (e.g. System.IComparable`1) and then expand by calling MakeGenericType
        // to find the correct type. I believe this should be a bug in lots of other areas too.
        //Type^ comparableType = get_icomparable_of_t(type);
        //if (comparableType != nullptr && comparableType->IsAssignableFrom(type))
        //  rb_funcall(class_object, rb_intern("include"), 1, rb_const_get(rb_cObject, rb_intern("ClrComparableOfT")));
        //else {
          Type^ comparableType = System::IComparable::typeid;
          if (comparableType != nullptr && comparableType->IsAssignableFrom(type))
            rb_funcall(class_object, rb_intern("include"), 1, rb_const_get(rb_cObject, rb_intern("ClrComparable")));
        //}
      }

      return class_object;
    }

    Type^ get_clr_type_from_symbol(VALUE symbol) {
      VALUE clr_type = rb_funcall(symbol, rb_intern("clr_type"), 0);
      return (Type^)Marshal::ToObject(clr_type);
    }

    // Bridge methods
    VALUE create_clr_class_object(VALUE self, VALUE class_name) {
      Type^ type       = find_type(Qnil, class_name);
      String^ typeName = Marshal::ToClrString(class_name);
      return internal_create_class_object(type, typeName);
    }

    VALUE create_clr_generic_type(int argc, VALUE *args, VALUE self) {
      if (argc < 3) rb_raise(rb_eRuntimeError, "Must supply at least one type parameter to cons method");

      VALUE generic_type_definition_class_name = args[0];
      VALUE ruby_class_name                    = args[1];

      String^ typeName = Marshal::ToClrString(ruby_class_name);
      Type^ type       = find_type(Qnil, generic_type_definition_class_name);

      array<Type^>^ types = gcnew array<Type^>(argc - 2);
      for (int i = 0; i < argc - 2; ++i)
        types[i] = get_clr_type_from_symbol(args[i + 2]);

      Type^ genericType = type->MakeGenericType(types);
      return internal_create_class_object(genericType, typeName);
    }

    VALUE create_clr_array_type(VALUE self, VALUE array_type, VALUE dimensions) {
      return Qnil;
    }

    VALUE get_instance_member_info(VALUE self, VALUE member_name, VALUE literal_member_name) {
      return (gcnew RubyType(rb_class_of(self)))->GetInstanceMemberInfo(member_name, literal_member_name);
    }

    VALUE get_static_member_info(VALUE self, VALUE member_name, VALUE literal_member_name) {
      return (gcnew RubyType(self))->GetStaticMemberInfo(member_name, literal_member_name);
    }

    VALUE get_constructor_info(VALUE self, VALUE klass) {
      return (gcnew RubyType(klass))->GetConstructorInfo();
    }

    VALUE get_types_in_loaded_assemblies(VALUE self) {
      return RubyAssembly::GetTypeNamesFromLoadedAssemblies();
    }

    VALUE get_names_of_loaded_assemblies(VALUE self) {
      return RubyAssembly::GetNamesOfLoadedAssemblies();
    }

    VALUE reference(VALUE self, VALUE assembly_name) {
      return RubyAssembly::GetTypeNamesFromAssemblyName(assembly_name);
    }

    VALUE reference_file(VALUE self, VALUE assembly_path) {
      return RubyAssembly::GetTypeNamesFromAssemblyPath(assembly_path);
    }

    VALUE get_enum_names(VALUE self, VALUE klass) {
      return (gcnew RubyType(klass))->GetEnumNames();
    }

    VALUE get_enum_values(VALUE self, VALUE klass) {
      return (gcnew RubyType(klass))->GetEnumValues();
    }

    VALUE get_clr_type(VALUE self, VALUE clr_type) {
      VALUE class_object = Marshal::GetRubyClassObject(Type::typeid);
      Type^ type         = (Type^)Marshal::ToObject(clr_type);
      return Marshal::ToRubyObjectByRef(class_object, type);
    }

    void Managed_Init_Runtime() {
      g_module = rb_define_module("RubyClr");

      rb_define_module_function(g_module, "create_dynamic_method", RUBY_METHOD_FUNC(create_dynamic_method), 3);
      rb_define_module_function(g_module, "create_event_dynamic_method", RUBY_METHOD_FUNC(create_event_dynamic_method), 3);
      rb_define_module_function(g_module, "get_cil_generator", RUBY_METHOD_FUNC(get_cil_generator), 1);
      rb_define_module_function(g_module, "create_label_dictionary", RUBY_METHOD_FUNC(create_label_dictionary), 0);
      rb_define_module_function(g_module, "create_variable_dictionary", RUBY_METHOD_FUNC(create_variable_dictionary), 0);
      rb_define_module_function(g_module, "create_namespace_list", RUBY_METHOD_FUNC(create_namespace_list), 0);
      rb_define_module_function(g_module, "is_value_type?", RUBY_METHOD_FUNC(is_value_type), 1);
      rb_define_module_function(g_module, "is_enum?", RUBY_METHOD_FUNC(is_enum), 1);
      rb_define_module_function(g_module, "emit", RUBY_METHOD_FUNC(emit), 1);
      rb_define_module_function(g_module, "emit_method_ref", RUBY_METHOD_FUNC(emit_method_ref), 6);
      rb_define_module_function(g_module, "emit_ctor_ref", RUBY_METHOD_FUNC(emit_ctor_ref), 3);
      rb_define_module_function(g_module, "emit_field_ref", RUBY_METHOD_FUNC(emit_field_ref), 4);
      rb_define_module_function(g_module, "emit_type_ref", RUBY_METHOD_FUNC(emit_type_ref), 2);
      rb_define_module_function(g_module, "emit_string", RUBY_METHOD_FUNC(emit_string), 2);
      rb_define_module_function(g_module, "emit_label", RUBY_METHOD_FUNC(emit_label), 2);
      rb_define_module_function(g_module, "emit_int64", RUBY_METHOD_FUNC(emit_int64), 2);
      rb_define_module_function(g_module, "emit_int32", RUBY_METHOD_FUNC(emit_int32), 2);
      rb_define_module_function(g_module, "emit_int16", RUBY_METHOD_FUNC(emit_int16), 2);
      rb_define_module_function(g_module, "emit_int8", RUBY_METHOD_FUNC(emit_int8), 2);
      rb_define_module_function(g_module, "emit_uint8", RUBY_METHOD_FUNC(emit_uint8), 2);
      rb_define_module_function(g_module, "emit_double", RUBY_METHOD_FUNC(emit_double), 2);
      rb_define_module_function(g_module, "emit_local_variable_reference", RUBY_METHOD_FUNC(emit_local_variable_reference), 2);
      rb_define_module_function(g_module, "emit_switch_statement", RUBY_METHOD_FUNC(emit_switch_statement), 1);
      rb_define_module_function(g_module, "define_ruby_method", RUBY_METHOD_FUNC(define_ruby_method), 3);
      rb_define_module_function(g_module, "define_ruby_module_function", RUBY_METHOD_FUNC(define_ruby_module_function), 3);
      rb_define_module_function(g_module, "define_ruby_singleton_method", RUBY_METHOD_FUNC(define_ruby_singleton_method), 3);
      rb_define_module_function(g_module, "define_event_method", RUBY_METHOD_FUNC(define_event_method), 4);
      rb_define_module_function(g_module, "append_namespaces", RUBY_METHOD_FUNC(append_namespaces), 1);
      rb_define_module_function(g_module, "label", RUBY_METHOD_FUNC(label), 1);
      rb_define_module_function(g_module, "declare", RUBY_METHOD_FUNC(declare), 2);
      rb_define_module_function(g_module, "try", RUBY_METHOD_FUNC(begin_exception_block), 0);
      rb_define_module_function(g_module, "catch_ex", RUBY_METHOD_FUNC(begin_catch_block), 1);
      rb_define_module_function(g_module, "end_try", RUBY_METHOD_FUNC(end_exception_block), 0);
      rb_define_module_function(g_module, "ld_block", RUBY_METHOD_FUNC(ld_block), 1);
      rb_define_module_function(g_module, "intern", RUBY_METHOD_FUNC(intern), 1);
      rb_define_module_function(g_module, "call_ruby_varargs", RUBY_METHOD_FUNC(call_ruby_varargs), 2);
      rb_define_module_function(g_module, "call_ruby", RUBY_METHOD_FUNC(call_ruby), 1);

      rb_define_module_function(g_module, "create_clr_class_object", RUBY_METHOD_FUNC(create_clr_class_object), 1);
      rb_define_module_function(g_module, "create_clr_generic_type", RUBY_METHOD_FUNC(create_clr_generic_type), -1);
      rb_define_module_function(g_module, "get_constructor_info", RUBY_METHOD_FUNC(get_constructor_info), 1);
      rb_define_module_function(g_module, "get_static_member_info", RUBY_METHOD_FUNC(get_static_member_info), 2);
      rb_define_module_function(g_module, "get_instance_member_info", RUBY_METHOD_FUNC(get_instance_member_info), 2);
      rb_define_module_function(g_module, "get_enum_names", RUBY_METHOD_FUNC(get_enum_names), 1);
      rb_define_module_function(g_module, "get_enum_values", RUBY_METHOD_FUNC(get_enum_values), 1);
      rb_define_module_function(g_module, "get_clr_type", RUBY_METHOD_FUNC(get_clr_type), 1);

      rb_define_module_function(g_module, "internal_reference", RUBY_METHOD_FUNC(reference), 1);
      rb_define_module_function(g_module, "internal_reference_file", RUBY_METHOD_FUNC(reference_file), 1);
      rb_define_module_function(g_module, "get_types_in_loaded_assemblies", RUBY_METHOD_FUNC(get_types_in_loaded_assemblies), 0);
      rb_define_module_function(g_module, "get_names_of_loaded_assemblies", RUBY_METHOD_FUNC(get_names_of_loaded_assemblies), 0);

      rb_require("dynamicmethod.rb");
    }
#pragma unmanaged
    // Main entry point
    __declspec(dllexport) void Init_Runtime() {
      CoInitializeEx(0, COINIT_APARTMENTTHREADED);
      Managed_Init_Runtime();
    }
  }
}