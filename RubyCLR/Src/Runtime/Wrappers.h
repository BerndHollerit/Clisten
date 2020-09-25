// This file contains wrapper classes for Ruby types that are marshaled
// to the CLR. The first set of wrapper classes add support for data-binding.

#pragma once

namespace RubyClr {
  public ref class DataBinderEventArgs : EventArgs {
  public:
    DataBinderEventArgs(int index) { Index = index; }

    int     Index;
    Object^ CurrentObject;
  };

  public ref class GetCountEventArgs : EventArgs {
  public:
    int Count;
  };

  public delegate void DataBinderEventHandler(Object^ sender, DataBinderEventArgs^ args);
  public delegate void GetCountEventHandler(Object^ sender, GetCountEventArgs^ args);

  public ref class DataBinder : System::Collections::IList {
  public:
    ref class Enumerator : System::Collections::IEnumerator {
      DataBinder^ _binder;
      int         _position;
    public:
      Enumerator(DataBinder^ binder) : _binder(binder), _position(-1) {}

      property virtual Object^ Current {
        Object^ get() { return _binder[_position]; }
      }

      virtual bool MoveNext() {
        _position++;
        return _binder->Count != _position;
      }

      virtual void Reset() { _position = -1; }
    };

    property virtual bool IsFixedSize { 
      bool get() { return true; }
    }

    property virtual bool IsReadOnly { 
      bool get() { return true; }
    }

    property virtual int Count {
      int get() { 
        GetCountEventArgs^ args = gcnew GetCountEventArgs();
        GetCount(this, args);
        return args->Count;
      }
    }

    property virtual bool IsSynchronized {
      bool get() { return false; }
    }

    property virtual Object^ SyncRoot {
      Object^ get() { 
        throw gcnew NotImplementedException();
      }
    }

    property virtual Object^ default[int] {
      Object^ get(int index) { 
        DataBinderEventArgs^ args = gcnew DataBinderEventArgs(index);
        GetData(this, args);
        return args->CurrentObject;
      }

      void set(int index, Object^ item) {
        throw gcnew NotImplementedException();
      }
    }

    virtual void CopyTo(Array^ ary, int index) {
      throw gcnew NotImplementedException();
    }

    virtual int Add(Object^ item) {
      throw gcnew NotImplementedException();
    }

    virtual void Clear() {
      throw gcnew NotImplementedException();
    }

    virtual bool Contains(Object^ item) {
      throw gcnew NotImplementedException();
    }

    virtual int IndexOf(Object^ item) {
      throw gcnew NotImplementedException();
    }

    virtual void Insert(int index, Object^ item) {
      throw gcnew NotImplementedException();
    }

    virtual void Remove(Object^ item) {
      throw gcnew NotImplementedException();
    }

    virtual void RemoveAt(int index) {
      throw gcnew NotImplementedException();
    }

    event DataBinderEventHandler^ GetData;
    event GetCountEventHandler^ GetCount;

    virtual System::Collections::IEnumerator^ GetEnumerator() { 
      return gcnew Enumerator(this);
    }
  };
}