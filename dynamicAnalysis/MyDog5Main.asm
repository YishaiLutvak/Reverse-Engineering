004015e3 push    ebp
004015e4 mov     ebp, esp
004015e6 push    edi
004015e7 push    esi
004015e8 push    ebx
004015e9 and     esp, 0FFFFFFF0h
004015ec sub     esp, 490h
004015f2 call    MyDog5+0x30b0 (004030b0)

004015f7 mov     dword ptr [esp+484h], 9
00401602 lea     eax, [esp+0FCh]
00401609 mov     ebx, offset MyDog5+0x4040 (00404040)
0040160e mov     edx, 0E1h
00401613 mov     edi, eax
00401615 mov     esi, ebx
00401617 mov     ecx, edx
00401619 rep movs dword ptr es:[edi], dword ptr [esi]
0040161b mov     dword ptr [esp+48Ch], 0
00401626 jmp     MyDog5+0x164b (0040164b)

\\---------------------------------------------------------------

00401628 lea     edx, [esp+0FCh]
0040162f mov     eax, dword ptr [esp+48Ch]
00401636 imul    eax, eax, 64h
00401639 add     eax, edx
0040163b mov     dword ptr [esp], eax
0040163e call    MyDog5+0x3838 (00403838)

00401643 add     dword ptr [esp+48Ch], 1							//[esp+48Ch]~counter

\\---------------------------------------------------------------

0040164b mov     eax, dword ptr [esp+48Ch]
00401652 cmp     eax, dword ptr [esp+484h]
00401659 jl      MyDog5+0x1628 (00401628)

\\---------------------------------------------------------------

0040165b mov     dword ptr [esp], offset MyDog5+0x5008 (00405008)
00401662 call    MyDog5+0x3838 (00403838)

00401667 mov     eax, dword ptr [MyDog5+0x7194 (00407194)]
0040166c mov     edx, eax
0040166e mov     eax, 21h
00401673 mov     dword ptr [esp+8], edx
00401677 mov     dword ptr [esp+4], eax
0040167b lea     eax, [esp+15h]
0040167f mov     dword ptr [esp], eax
00401682 call    MyDog5+0x3840 (00403840)

00401687 lea     eax, [esp+15h]
0040168b mov     dword ptr [esp], eax
0040168e call    MyDog5+0x3808 (00403808)
00401693 sub     eax, 1
00401696 mov     dword ptr [esp+4], eax
0040169a lea     eax, [esp+15h]
0040169e mov     dword ptr [esp], eax
004016a1 call    MyDog5+0x1500 (00401500)

004016a6 mov     dword ptr [esp+480h], eax
004016ad mov     dword ptr [esp+8], offset MyDog5+0x5031 (00405031)
004016b5 mov     eax, dword ptr [esp+480h]
004016bc mov     dword ptr [esp+4], eax
004016c0 lea     eax, [esp+36h]
004016c4 mov     dword ptr [esp], eax
004016c7 call    MyDog5+0x3848 (00403848)

004016cc lea     eax, [esp+78h]
004016d0 mov     ebx, offset MyDog5+0x4400 (00404400)
004016d5 mov     edx, 21h
004016da mov     edi, eax
004016dc mov     esi, ebx
004016de mov     ecx, edx
004016e0 rep movs dword ptr es:[edi], dword ptr [esi]
004016e2 mov     dword ptr [esp+488h], 0
004016ed jmp     MyDog5+0x1713 (00401713)

\\---------------------------------------------------------------

004016ef mov     eax, dword ptr [esp+488h]
004016f6 mov     eax, dword ptr [esp+eax*4+78h]
004016fa mov     ecx, eax
004016fc lea     edx, [esp+57h]
00401700 mov     eax, dword ptr [esp+488h]
00401707 add     eax, edx
00401709 mov     byte ptr [eax], cl
0040170b add     dword ptr [esp+488h], 1
00401713 cmp     dword ptr [esp+488h], 20h
0040171b jle     MyDog5+0x16ef (004016ef)

\\---------------------------------------------------------------

0040171d lea     eax, [esp+57h]
00401721 mov     dword ptr [esp+4], eax
00401725 lea     eax, [esp+36h]
00401729 mov     dword ptr [esp], eax
0040172c call    MyDog5+0x3850 (00403850)							// msvcrt!strcmp

00401731 test    eax, eax
00401733 jne     MyDog5+0x1743 (00401743)							// critical condition

\\---------------------------------------------------------------

00401735 mov     dword ptr [esp], offset MyDog5+0x5038 (00405038)
0040173c call    MyDog5+0x3858 (00403858)

00401741 jmp     MyDog5+0x174f (0040174f)

\\---------------------------------------------------------------

00401743 mov     dword ptr [esp], offset MyDog5+0x5058 (00405058)
0040174a call    MyDog5+0x3858 (00403858)

0040174f mov     eax, 0
00401754 lea     esp, [ebp-0Ch]
00401757 pop     ebx
00401758 pop     esi
00401759 pop     edi
0040175a pop     ebp
0040175b ret     
