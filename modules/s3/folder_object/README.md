## How To Use Fileset function

```sh
 fileset(path.module, "files/*.txt")
[
  "files/hello.txt",
  "files/world.txt",
]

fileset(path.module, "files/{hello,world}.txt")
[
  "files/hello.txt",
  "files/world.txt",
]

fileset("${path.module}/files", "*")
[
  "hello.txt",
  "world.txt",
]

fileset("${path.module}/files", "**")
[
  "hello.txt",
  "world.txt",
  "subdirectory/anotherfile.txt",
]
```