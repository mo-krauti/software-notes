# mixing with c

https://isocpp.org/wiki/faq/mixing-c-and-cpp

## call c from cpp

In `.h` header add
```c
#ifdef __cplusplus
extern "C" {
#endif
```
to start and
```c
#ifdef __cplusplus
}
#endif
```
to the end of the file.

Or if you do not want to touch the header file, wrap the include in your cpp
```cpp
extern "C" {
  #include "my_c_header.h"
}
```

## call cpp from c

In `.hpp` header use
```cpp
#ifdef __cplusplus
extern "C" {
#endif
	void myfunc();
#ifdef __cplusplus
}
#endif
```

In `.cpp`
```cpp
extern "C" void myfunc() {
  //foo();
}
```
