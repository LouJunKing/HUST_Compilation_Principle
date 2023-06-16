### 看来都不打算给工程了
修改codegen.c即可   
分三步走   
### 第一步
28行处选择目标三元组
```cpp
  //auto target_triple = module->getTargetTriple();
  //auto target_triple = getDefaultTargetTriple();
  auto target_triple = "riscv64-unknown-elf";
  //auto target_triple = "armv7-unknown-linux-gnueagihf";
```
目标代码平台是riscv64，所以选第三个，把其他三个注释掉   
然后**attention！！** 相比armv7，要在55行改一个参数
```cpp
  auto cpu = "generic-rv64";
```    
然后就和armv7一样了
### 第二步
40行处把文档里的那几个初始化函数放进去
```cpp
  InitializeAllTargetInfos();
  InitializeAllTargets();
  InitializeAllTargetMCs();
  InitializeAllAsmParsers();
  InitializeAllAsmPrinters();
```
### 第三步
77行处，把注释说的那几个参数初始化以下就好了   
跟文档一样   
```cpp
  auto Filename = getGenFilename(ir_filename, gen_filetype);
  std::error_code EC;
  raw_fd_ostream dest(Filename, EC, sys::fs::OF_None);
  legacy::PassManager pass;
  auto file_type = gen_filetype;
```

### 完了，捏嘿嘿
基本照着文档写，文档写得挺完善的
