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
#pagebreak()
== 答案
#pe[
  flag{so_very_easy_xor}
][
  F1nd\*
][
  flag{ReV3rSe!}
][
  flag{SEH_AFFINE_2026}
][
  flag{rc4_junk_flow_2026}
]

