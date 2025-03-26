# mixing with c

https://isocpp.org/wiki/faq/mixing-c-and-cpp

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
