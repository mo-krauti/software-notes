## resources

* [general guide](https://cgi.cse.unsw.edu.au/~learn/debugging/modules/all_gdb/)
* [threads](https://sourceware.org/gdb/current/onlinedocs/gdb.html/Threads.html)
* [debugging hardfaults](https://interrupt.memfault.com/blog/cortex-m-hardfault-debug)
* [improved terminal interface](https://github.com/cyrus-and/gdb-dashboard)

## viewing registers using svd

Make sure your `gdb` has python support.
```bash
pip install git+https://github.com/bnahill/PyCortexMDebug.git
```

Add to your project `.gdbinit`:
```
python

from cmdebug.svd_gdb import LoadSVD
LoadSVD()

end

svd_load path_to_board.svd
```

Add to your `~/.gdbinit`
```
# safe paths
add-auto-load-safe-path /path/to/project/.gdbinit
```
Otherwise the project `.gdbinit` might not load.
