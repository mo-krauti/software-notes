# Rule of five

## Destruktor
```cpp
  ~Example() {
    //
  }
```
Aufgerufen bei:
```cpp
Example example = new Example();
delete example; // hier
```


## Copy Konstruktor
```cpp
  Example(const Example& src) {
  //
  }
```
Aufgerufen bei:
```cpp
Example example1 = new Example();
Example example2 = example1; //hier
```


## Copy Zuweisung
```cpp
  example& operator=(const example& src)
  //
  }
```
Aufgerufen bei:
```cpp
Example example1 = new Example();
Example example2 = new Example();
Example example2 = example1; //hier
```


## Move Konstruktor
```cpp
  example(example&& src) {
  //
  }
```
Aufgerufen bei:
```cpp
Example example1 = new Example(); //hier
```


## Move Zuweisung
```cpp
  example& operator=(example&& src) {
  //
  }
```
Aufgerufen bei:
```cpp
Example example1 = new Example();
Example example1 = new Example(); //hier
```

