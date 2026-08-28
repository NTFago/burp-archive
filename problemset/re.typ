#import "/facade.typ": *

#show: show-body-file

= 逆向课程2026年春
#pe[
  #link("https://github.com/NTFago/burp-archive/blob/main/attachment/2026/%E9%80%86%E5%90%91%E8%AF%BE%E7%A8%8B2026%E6%98%A501/CPP1.exe")[题目附件]

  #styled-raw[
```c
int __cdecl main_0(int argc, const char **argv, const char **envp)
{
  char Str[61]; // [esp+4Ch] [ebp-40h] BYREF
  __int16 v5; // [esp+89h] [ebp-3h]
  char v6; // [esp+8Bh] [ebp-1h]

  memset(Str, 0, sizeof(Str));
  v5 = 0;
  v6 = 0;
  puts("Input:");
  if ( !fgets(Str, 64, (FILE *)&Stream) )
    return 0;
  Str[strcspn(Str, "\r\n")] = 0;
  if ( sub_401100(Str) )
    puts("Right!");
  else
    puts("Wrong!");
  system("pause");
  return 0;
}
```
  ]
][
    #link("https://github.com/NTFago/burp-archive/blob/main/attachment/2026/%E9%80%86%E5%90%91%E8%AF%BE%E7%A8%8B2026%E6%98%A502/CPP2.exe")[题目附件]

    #styled-raw[
```c
int __cdecl main_0(int argc, const char **argv, const char **envp)
{
  size_t v4; // eax
  int i; // [esp+70h] [ebp-450h]
  char Destination; // [esp+74h] [ebp-44Ch] BYREF
  int v7; // [esp+75h] [ebp-44Bh]
  char Source[1021]; // [esp+7Ch] [ebp-444h] BYREF
  __int16 v9; // [esp+479h] [ebp-47h]
  char v10; // [esp+47Bh] [ebp-45h]
  char Str1[68]; // [esp+47Ch] [ebp-44h] BYREF

  memset(Str1, 0, 65);
  memset(Source, 0, sizeof(Source));
  v9 = 0;
  v10 = 0;
  Destination = 0;
  v7 = 0;
  printf("Please input your flag:\n");
  scanf("%s", Source);
  if ( strlen(Source) >= 5 )
  {
    strncpy(&Destination, Source, 4u);
    v4 = strlen(&Destination);
    sub_401005(Str1, (int)&Destination, v4);
    for ( i = 0; i < 64; ++i )
    {
      if ( --Str1[i] == 96 )
        Str1[i] = 102;
      if ( Str1[i] == 47 )
        Str1[i] = 57;
    }
    if ( !strncmp(Str1, "09d7b11ce21f469ca7efa5deaa9a6321e7e796ce85bb3a2bb550e84700346ef0", 0x40u) )
      printf("Good job!");
    else
      printf("Don't worry, try again!");
    system("pause");
    return 0;
  }
  else
  {
    printf("Wrong,try again!\n");
    system("pause");
    return 0;
  }
}
```
    ]
][
  #link("https://github.com/NTFago/burp-archive/blob/main/attachment/2026/%E9%80%86%E5%90%91%E8%AF%BE%E7%A8%8B2026%E6%98%A503/CPP3.exe")[题目附件]

  #styled-raw[
```c
int __cdecl main_0(int argc, const char **argv, const char **envp)
{
  int i; // [esp+4Ch] [ebp-64h]
  int j; // [esp+4Ch] [ebp-64h]
  _BYTE v6[8]; // [esp+50h] [ebp-60h] BYREF
  char v7; // [esp+58h] [ebp-58h] BYREF
  int v8; // [esp+59h] [ebp-57h]
  int v9; // [esp+5Dh] [ebp-53h]
  char Str1[61]; // [esp+64h] [ebp-4Ch] BYREF
  __int16 v11; // [esp+A1h] [ebp-Fh]
  char v12; // [esp+A3h] [ebp-Dh]
  char v13; // [esp+A4h] [ebp-Ch] BYREF
  int v14; // [esp+A5h] [ebp-Bh]
  int v15; // [esp+A9h] [ebp-7h]

  v13 = 0;
  v14 = 0;
  v15 = 0;
  memset(Str1, 0, sizeof(Str1));
  v11 = 0;
  v12 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  puts("Please input your flag:");
  scanf("%63s", Str1);
  if ( strlen(Str1) == 14 && !strncmp(Str1, "flag{", 5u) && Str1[13] == 125 )
  {
    for ( i = 0; i < 8; ++i )
    {
      *(&v13 + i) = byte_42AA40[i] ^ byte_42AA38[i];
      *(&v7 + i) = Str1[i + 5];
    }
    HIBYTE(v15) = 0;
    HIBYTE(v9) = 0;
    sub_40100F(&v13);
    sub_401032(&v7, v6);
    for ( j = 0; j < 8; ++j )
    {
      if ( v6[j] != byte_42AA30[j] )
      {
        puts("Wrong!!");
        system("pause");
        return -1;
      }
    }
    puts("Correct!!");
    system("pause");
    return 0;
  }
  else
  {
    puts("Wrong!!");
    system("pause");
    return -1;
  }
}
```
  ]
][
  #link("https://github.com/NTFago/burp-archive/blob/main/attachment/2026/%E9%80%86%E5%90%91%E8%AF%BE%E7%A8%8B2026%E6%98%A504/CPP4.exe")[题目附件]

  #styled-raw[
```c
int __cdecl main_0(int argc, const char **argv, const char **envp)
{
  char Str1[125]; // [esp+4Ch] [ebp-80h] BYREF
  __int16 v5; // [esp+C9h] [ebp-3h]
  char v6; // [esp+CBh] [ebp-1h]

  memset(Str1, 0, sizeof(Str1));
  v5 = 0;
  v6 = 0;
  puts("Input flag:");
  scanf("%127s", Str1);
  if ( sub_4010E0(Str1) )
    puts("Correct.");
  else
    puts("Wrong.");
  system("pause");
  return 0;
}
```
  ]
][
  #link("https://github.com/NTFago/burp-archive/blob/main/attachment/2026/%E9%80%86%E5%90%91%E8%AF%BE%E7%A8%8B2026%E6%98%A505/CPP5.exe")[题目附件]

  #styled-raw[
```c
int __cdecl main_0(int argc, const char **argv, const char **envp)
{
  char Str[61]; // [esp+4Ch] [ebp-40h] BYREF
  __int16 v5; // [esp+89h] [ebp-3h]
  char v6; // [esp+8Bh] [ebp-1h]

  memset(Str, 0, sizeof(Str));
  v5 = 0;
  v6 = 0;
  puts("Input:");
  if ( !fgets(Str, 64, (FILE *)&Stream) )
    return 0;
  Str[strcspn(Str, "\r\n")] = 0;
  if ( sub_401100(Str) )
    puts("Right!");
  else
    puts("Wrong!");
  system("pause");
  return 0;
}
```
  ]
]

== 答案
#pe[
  `flag{so_very_easy_xor}`
][
  `F1nd*`
][
  `flag{ReV3rSe!}`
][
  `flag{SEH_AFFINE_2026}`
][
  `flag{rc4_junk_flow_2026}`
]

#pagebreak()

== 解题思路
#pe[
  *考点：异或运算、位操作*
  #indented-par[在`main_0`中我们可以看到，程序通过`fgets`函数获取用户的输入，并存放到变量`Str`中，随后去掉末尾的换行符。接着，程序调用了`sub_401100`函数，并将用户输入的字符串作为参数传入。根据上下文，我们可以推测`sub_401100`是一个验证函数，用于检查用户输入的字符串是否符合预期的格式或内容。接下来我们需要分析`sub_401100`中的逻辑。]
  ```c
int __cdecl sub_401100(char *Str)
{
  char *v2; // edx
  int i; // [esp+50h] [ebp-4h]

  if ( strlen(Str) != 22 )
    return 0;
  for ( i = 0; i < 22; ++i )
  {
    v2 = &Str[i];
    LOBYTE(v2) = Str[i] ^ 0x21;
    if ( (unsigned __int8)sub_4011D0(v2) != (unsigned __int8)byte_42501C[i] )
      return 0;
  }
  return 1;
}
```
  #indented-par[在`sub_401100`函数中，首先检查输入字符串的长度是否为22，如果不是，则返回0。接着，遍历每一个字符，与`0x21`进行异或运算，并将结果传递给`sub_4011D0`函数。然后，将`sub_4011D0`的返回值与预定义的数组`byte_42501C`中的对应值进行比较。我们继续看`sub_4011D0`函数的实现。]
  ```c
  int __cdecl sub_4011D0(unsigned __int8 a1)
{
  return ((int)a1 >> 7) | (2 * a1);
}
```
  #indented-par[`sub_4011D0`函数对输入的字符进行位操作。它将输入字符右移7位，并将结果与输入字符左移1位的结果相加。即，将原本的最低位移到最高位。`byte_42501C`中内容如下：]
  ```
.rdata:0042501C byte_42501C   db 8Eh, 9Ah, 80h, 8Ch, 0B4h, 0A4h, 9Ch, 0FCh, 0AEh, 88h
.rdata:00425026               db 0A6h, 0B0h, 0FCh, 88h, 80h, 0A4h, 0B0h, 0FCh, 0B2h
.rdata:0042502F               db 9Ch, 0A6h, 0B8h, 6 dup(0)
```

  === 解题脚本
  ```python
target = [0x8e, 0x9a, 0x80, 0x8c, 0xb4, 0xa4, 0x9c, 0xfc, 0xae, 0x88, 0xa6, 0xb0, 0xfc, 0x88, 0x80, 0xa4, 0xb0, 0xfc, 0xb2, 0x9c, 0xa6, 0xb8]
flag = ''.join(chr((x >> 1) ^ 0x21) for x in target)
print(flag)    # flag{so_very_easy_xor}
```
][
  *考点：恺撒加密、SHA-256*
  #indented-par[在`main_0`中，程序使用`scanf`函数获取用户的输入存放在变量`Source`中，并在下一行对输入字符长度做校验：要求输入字符串长度大于等于5个字符。随后使用`strncpy`取前4个字符至变量`Destination`中。接着，将得到的`Destination`传入`sub_401005`做加密，我们先不对这个函数做分析。
  
  在`sub_401005`调用结束后，对`Str1`中的内容做遍历，重点讲解一下此处的逻辑：]
  ```c
for ( i = 0; i < 64; ++i )
{
  if ( --Str1[i] == 96 )
    Str1[i] = 102;
  if ( Str1[i] == 47 )
    Str1[i] = 57;
}
```
  #indented-par[注意这里的 *`if (--Str1[i] == 96)`* ，它等价于
```c
Str1[i] = Str1[i] - 1
if (Str1[i] == 96)
// others
```
  故在一个`if`表达式的时候，`Str1`里的字符已经做了减1，即向前移动一个字符的操作。故整个遍历就是做了密钥为`-1`的恺撒加密。要注意的是，这里恺撒加密的字符集只有`0-9a-f`，对应16进制的字符串。后面程序将恺撒加密后的`Str1`与某一常量做对比，从*长度和样式*中不难看出，为`SHA-256`哈希函数的返回值。读者可以自行查看`sub_401005`函数的逻辑。]
  === 解题脚本
  ```python
from hashlib import sha256
from string import printable
from itertools import product

target = "09d7b11ce21f469ca7efa5deaa9a6321e7e796ce85bb3a2bb550e84700346ef0"
target_real = ""

for c in target:
    c = chr(ord(c) + 1)
    if c == ':':
        c = '0'
    if c == 'g':
        c = 'a'
    target_real += c
# target_real = '10e8c22df32a570db8fab6efbb0b7432f8f807df96cc4b3cc661f95811457fa1'
for j in product(printable, repeat=4):
    flag = "".join(j)
    if sha256(flag.encode()).hexdigest().lower() == target_real:
        print(flag)    # F1nd
        break
```
][
  *考点：DES 分组加密*
  #indented-par[在`main_0`中，程序用`scanf`读入输入到`Str1`，随后校验长度与格式：长度必须为 14、以`flag{`开头、并以`}`结尾。接着程序通过逐字节异或得到一个 8 字节的密钥，并把输入的 8 个字符作为明文：]

  ```c
  for ( i = 0; i < 8; ++i )
  {
    *(&v13 + i) = byte_42AA40[i] ^ byte_42AA38[i];   // 密钥
    *(&v7 + i) = Str1[i + 5];                        // 明文
  }
  sub_40100F(&v13);    // 密钥扩展
  sub_401032(&v7, v6); // 加密
  for ( j = 0; j < 8; ++j )
    if ( v6[j] != byte_42AA30[j] )   // 与密文比较
  ```

  #indented-par[我们先看密钥扩展`sub_40100F`：它先把 8 字节密钥按位展开成 64 位，再做 64→56 的置换（PC-1），随后循环 16 轮，每轮把 56 位分成左右两半分别循环左移，再经 56→48 的置换（PC-2）得到该轮子密钥。]

  ```c
  sub_40101E(a1, v6, 8);          // 字节 → 位（64 位）
  sub_401046(v6, v4);             // PC-1（64 → 56 位）
  for ( i = 0; i < 16; ++i )
  {
    sub_401014(v4, (int)v4, byte_428154[i]);   // 左半循环左移
    sub_401014(v5, (int)v5, byte_428154[i]);   // 右半循环左移
    sub_40100A(v4, Src);                       // PC-2（56 → 48 位）
    memcpy((char *)&unk_42DCAC + 48 * i, Src, 0x30u);  // 保存第 i 轮子密钥
  }
  ```

  #indented-par[再看加密`sub_401032`：8 字节明文按位展开后先经初始置换 IP，再进入 16 轮 Feistel 结构，每轮调用轮函数`sub_401005`并与子密钥做异或，最后经逆初始置换 `IP^-1` 把 64 位拼回 8 字节。
  在实际做题中，我们可以通过几个特征断言标准 DES：
  - 分组 8 字节、共 16 轮；
  - 循环左移的轮移位数`byte_428154 = 1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1`；
  - PC-1、PC-2 两张置换表]
  === 解题脚本
  ```python
from Crypto.Cipher import DES

a = [0x55, 0x11, 0x40, 0x04, 0x3E, 0x55, 0x2E, 0x29]
b = [0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x08]
key = bytes(x ^ y for x, y in zip(a, b))     # b'D3s@k3Y!'
ct = bytes([0x7E, 0xC4, 0x9F, 0x98, 0x00, 0xF0, 0x42, 0x6E])
pt = DES.new(key, DES.MODE_ECB).decrypt(ct)

print('flag{' + pt.decode() + '}')           # flag{ReV3rSe!}
```
][
  *考点：仿射密码、SEH 结构化异常处理*
  #indented-par[`main_0` 中程序用 `scanf` 读入输入后直接调用 `sub_4010E0` 校验。先看这个函数：]

  ```c
  BOOL __cdecl sub_4010E0(char *Str1)
  {
    char Str[15]; // [esp+5Ch] [ebp-28h] BYREF
    CPPEH_RECORD ms_exc; // [esp+6Ch] [ebp-18h]

    memset(Str, 0, sizeof(Str));
    if ( strlen(Str1) != 21 )
      return 0;
    if ( strncmp(Str1, "flag{", 5u) || Str1[20] != 125 )
      return 0;
    memcpy(Str, Str1 + 5, sizeof(Str));       // 取出 flag{ 与 } 之间的 15 个字符
    ms_exc.registration.TryLevel = 0;
    return 1 / (int)(21 - strlen(Str1)) == 4660;
  }
  ```

  #indented-par[注意最后一行 *`1 / (21 - strlen(Str1))`*：当输入长度为 21 时除数为 0，程序会触发*除零异常*。这正是本题的难点——`sub_4010E0` 在 `TryLevel = 0` 处注册了一个 C++ SEH（结构化异常处理）]
  ```
.text:004010E0 ; __unwind { // __except_handler3
.text:004010E0                 push    ebp
.text:004010E1                 mov     ebp, esp
.text:004010E3                 push    0FFFFFFFFh
.text:004010E5                 push    offset stru_4270A0
.text:004010EA                 push    offset __except_handler3
.text:004010EF                 mov     eax, large fs:0
.text:004010F5                 push    eax
.text:004010F6                 mov     large fs:0, esp
.text:004010FD                 add     esp, 0FFFFFF98h
.text:00401100                 push    ebx
.text:00401101                 push    esi
.text:00401102                 push    edi
.text:00401103                 mov     [ebp+ms_exc.old_esp], esp
  ```
  #indented-par[异常发生后并不崩溃，而是经作用域表 `stru_4270A0` 找到过滤器 `loc_4011D5`（恒返回 1，即执行处理器）与异常处理器 `loc_4011DB`：]
  ```
.rdata:004270A0 stru_4270A0     dd 0FFFFFFFFh           ; EnclosingLevel
.rdata:004270A0                                         ; DATA XREF: sub_4010E0+5↑o
.rdata:004270A4                 dd offset loc_4011D5    ; FilterFunc
.rdata:004270A8                 dd offset loc_4011DB    ; HandlerFunc
  ```
  ```
  // 异常处理器 loc_4011DB
  mov esp, [ebp+ms_exc.old_esp]   // 还原栈指针
  push Str                        // Str 即输入的 15 个字符
  call sub_401260                 // 真正的校验逻辑藏在这里
  ```

  #indented-par[`sub_401260` 要求内容长度为 15，然后对每个字符先通过 `sub_401360` 在 37 个字符的表中查找下标，再做仿射变换：]

  ```c
  int __cdecl sub_401360(char a1)   // 在字符表中查找下标，未找到返回 -1
  {
    for ( i = 0; i < 37; ++i )
      if ( byte_42701C[i] == a1 )
        return i;
    return -1;
  }

  BOOL __cdecl sub_401260(char *Str)
  {
    if ( strlen(Str) != 15 )
      return 0;
    for ( i = 0; i < 15; ++i )
    {
      v2 = sub_401360(Str[i]);                             // 明文下标 x
      if ( v2 < 0 )
        return 0;
      *(&Str1 + i) = byte_42701C[(5 * v2 + 12) % 37];      // 密文
    }
    return strcmp(&Str1, "26KHMAAPD6HE5EY") == 0;          // 与目标密文比较
  }
  ```

  #indented-par[字符表 `byte_42701C` 的内容为 `ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_`，共 37 个字符。加密为典型的*仿射密码*：$E(x) = (5x + 12) mod 37$。由于 $gcd(5, 37) = 1$，5 在模 37 下存在逆元 $5^{-1} ≡ 15 (mod 37)$，故解密函数为 $D(y) = (y - 12) times 15 mod 37$。对目标密文逐字符解出下标，再回查字符表即可得到明文。]

  === 解题脚本
  ```python
  table = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"
  target = "26KHMAAPD6HE5EY"

  inv5 = pow(5, -1, 37)               # 5 在模 37 下的逆元，即 15
  flag = ''.join(
      table[(table.index(c) - 12) * inv5 % 37] for c in target
  )
  print(f"flag{{{flag}}}")            # flag{SEH_AFFINE_2026}
  ```

][
  *考点：RC4 流密码、花指令*
  #indented-par[在`main_0`中，程序通过`fgets`获取输入并存放到`Str`中，去掉末尾换行符后调用`sub_401100`进行校验。进入`sub_401100`可以看到，程序先校验输入长度为 24，随后调用`sub_4011F0`生成一个 14 字节的密钥，再调用`sub_401270`完成 RC4 的 S盒初始化，最后通过`loc_4013B0`对输入做 PRGA加密，并与硬编码的密文做`memcmp`比较。]

  ```c
  BOOL __cdecl sub_401100(const char *Src)
  {
    _BYTE Buf1[24]; // [esp+4Ch] [ebp-128h] BYREF
    _BYTE v3[16];   // [esp+64h] [ebp-110h] BYREF
    _BYTE v4[256];  // [esp+74h] [ebp-100h] BYREF

    if ( strlen(Src) != 24 )
      return 0;
    sub_4011F0(v3);                 // 生成 14 字节密钥
    memcpy(Buf1, Src, sizeof(Buf1));
    sub_401270(v4, v3, 14);         // RC4 S-box init
    ((void (__cdecl *)(_BYTE *, int, _BYTE *))loc_4013B0)(Buf1, 24, v4);  // RC4 PRGA
    return memcmp(Buf1, &Buf2_, 0x18u) == 0;
  }
  ```

  #indented-par[先看密钥生成`sub_4011F0`：]
  ```c
  int __cdecl sub_4011F0(int a1)
  {
    for ( i = 0; i < 14; ++i )
      *(_BYTE *)(i + a1) = (7 * i + 90) ^ byte_42501C[i];
    return i + 1;
  }
  ```
  #indented-par[即密钥第`i`个字节为`(7*i + 90) ^ byte_42501C[i]`，其中`byte_42501C`是一段 14 字节的常量。代入即可算出密钥为字符串`rc4_junk_key26`。]

  #indented-par[再看`sub_401270`，这是标准的 RC4 KSA：先用`0..255`填充 S 盒，再用密钥与 S 盒做 256 轮交换。]
  ```c
  int __cdecl sub_401270(_BYTE *a1, _BYTE *a2, int n14)
  {
    for ( i = 0; i < 256; ++i )
      a1[i] = i;                          // S[i] = i
    for ( j = 0; j < 256; ++j )
    {
      v4 = (unsigned __int8)(a2[j % n14] + a1[j] + v4);  // j = (j + S[j] + key[j % 14]) & 0xff
      sub_401360(&a1[j], &a1[v4]);        // swap(S[j], S[v4])
    }
    return j + 1;
  }
  ```

  #indented-par[最后是加密核心`loc_4013B0`。这里就是本题的难点——函数里插入了*花指令*，导致 IDA 无法正常反编译出伪代码。我们看它的反汇编片段：]
  ```
  .text:004013F4  33 C0        xor  eax, eax
  .text:004013F6  74 01        jz   short loc_4013F9   ; ZF 恒为 1，必定跳转
  .text:004013F8  E9 ...       jmp  near ...           ; 花指令，实际执行不到
  ```
  #indented-par[`xor eax, eax`之后 ZF 恒为 1，因此`jz`一定会跳转到`loc_4013F8 + 1`，跳过`E9`这个字节落到下一条真实指令上；而`E9`处的那条`jmp`只是用来混淆的花指令，永远执行不到。把它剥离后，`loc_4013B0`的本质就是 RC4 的 PRGA，可还原为：]
  ```c
  j = i = 0;
  for ( k = 0; k < 24; ++k )
  {
    j = (j + 1) & 0xff;
    i = (i + S[j]) & 0xff;
    swap(S[i], S[j]);
    K = S[(S[i] + S[j]) & 0xff];
    Buf1[k] ^= ~K;      // 注意：密钥流字节做了按位取反
  }
  ```
  #indented-par[需要特别注意的是最后一步：与明文异或的并不是密钥流字节`K`本身，而是`~K`。这一处与标准 RC4 不同，做题时若忽略会解出乱码。密文`Buf2_`为 24 字节，将其与`~K`逐字节异或即可还原明文。]

  === 解题脚本
  ```python
  key_seed = [0x28, 0x02, 0x5c, 0x30, 0x1c, 0x08, 0xea, 0xe0,
              0xcd, 0xf2, 0xc5, 0xde, 0x9c, 0x83]            # byte_42501C
  ct = [0x08, 0x6f, 0x1a, 0x1b, 0x5c, 0xbf, 0xda, 0xc7,
        0x9a, 0x8d, 0xb8, 0xc5, 0xda, 0x78, 0xc3, 0x2b,
        0x4f, 0x79, 0x57, 0xec, 0xdf, 0xa2, 0xd5, 0x37]     # Buf2_ 密文

  key = bytes((7 * i + 90) ^ b for i, b in enumerate(key_seed))   # rc4_junk_key26

  S = list(range(256))
  j = 0
  for i in range(256):                          # KSA
      j = (j + S[i] + key[i % len(key)]) & 0xff
      S[i], S[j] = S[j], S[i]

  i = j = 0
  flag = []
  for k in range(len(ct)):                      # PRGA
      j = (j + 1) & 0xff
      i = (i + S[j]) & 0xff
      S[i], S[j] = S[j], S[i]
      K = S[(S[i] + S[j]) & 0xff]
      flag.append(ct[k] ^ ((~K) & 0xff))        # 密钥流取反后异或

  print(bytes(flag).decode())                   # flag{rc4_junk_flow_2026}
  ```
]