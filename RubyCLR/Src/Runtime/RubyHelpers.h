#pragma once

namespace RubyClr {
  ref class Ruby {
    static String^ StripCharactersAfter(String^ string, wchar_t delimiter) {
      return string->Substring(0, string->IndexOf(delimiter));
    }

    static String^ ArrayToRubyShadowClassName(Type^ type) {
      String^ fullName = StripCharactersAfter(type->FullName, '[');
      return String::Format("{0}_array_{1}", fullName, type->GetArrayRank());
    }

    static String^ GenericToRubyShadowClassName(Type^ type) {
      List<String^>^ typeNames = gcnew List<String^>();
      String^ name = StripCharactersAfter(type->Name, '`');
      array<Type^>^ args = type->GetGenericArguments();
      for each (Type^ arg in args)
        typeNames->Add(arg->Name);
      return String::Format("{0}.{1}_generic_{2}", type->Namespace, name, String::Join("_", typeNames->ToArray()));
    }

    static String^ ConvertTypeNameToRubySymbolName(String^ typeName) {
      return typeName->Replace(".", "::")->Replace("+", "::");
    }

  internal:
    static VALUE ToRubyString(String^ string) {
      IntPtr ptr   = System::Runtime::InteropServices::Marshal::StringToHGlobalAnsi(string);
      VALUE result = rb_str_new2((char*)(void*)ptr);
      System::Runtime::InteropServices::Marshal::FreeHGlobal(ptr);
      return result;
    }

    static VALUE EvalString(String^ expression) {
      IntPtr str = System::Runtime::InteropServices::Marshal::StringToHGlobalAnsi(expression);
      VALUE result = rb_eval_string((const char *)(void*)str);
      System::Runtime::InteropServices::Marshal::FreeHGlobal(str);
      return result;
    }

    static void RaiseRubyException(VALUE exceptionType, String^ formatString, ... array<String^>^ params) {
      String^ message = String::Format(formatString, params);
      rb_raise(exceptionType, STR2CSTR(ToRubyString(message)));
    }

    static String^ TypeArrayToString(array<Type^>^ types) {
      List<String^>^ typeNames = gcnew List<String^>(types->Length);
      for each (Type^ type in types)
        typeNames->Add(type->FullName);
      return String::Join(",", typeNames->ToArray());
    }

    static String^ TypeToRubyShadowClassName(Type^ type) {
      String^ typeName = type->FullName;

      if (type->IsArray) 
        typeName = ArrayToRubyShadowClassName(type);
      else if (type->IsGenericType) 
        typeName = GenericToRubyShadowClassName(type);
      else {
        // Map runtime type names to non-runtime type names
        if (typeName == "System.RuntimeType")                    typeName = "System.Type";
        if (typeName == "System.Reflection.RuntimeMethodInfo")   typeName = "System.Reflection.MethodInfo";
        if (typeName == "System.Reflection.RtFieldInfo")         typeName = "System.Reflection.FieldInfo";
        if (typeName == "System.Reflection.RuntimePropertyInfo") typeName = "System.Reflection.PropertyInfo";
        if (typeName == "System.Reflection.RuntimeEventInfo")    typeName = "System.Reflection.EventInfo";
      }
       
      return ConvertTypeNameToRubySymbolName(typeName);
    }
  };
}