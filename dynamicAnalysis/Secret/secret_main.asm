// main     
//block1-------------------------------------------------------
00401340  push    ebp
00401341  mov     ebp, esp
00401343  push    edi
00401344  push    esi
00401345  push    ebx
		  
00401346  and     esp, 0FFFFFFF0h
00401349  add     esp, 0FFFFFF80h
0040134c  call    Secret+0x1a20 (00401a20)
																	// esp=0060fe70
00401351  lea     edx, [esp+20h]                                    // edx=des_mes, # (esp+20h)~0060fe90~des_mes 
00401355  mov     eax, offset Secret+0x3034 (00403034)              // eax=src_mes, # 00403034~src_mes~"S{{p4c{f.4m{a4ufq4sq``}zs4}`5"
0040135a  mov     ecx, 11h                                          // ecx=17
0040135f  mov     edi, edx                                          // edi=0060fe90
00401361  mov     esi, eax                                          // esi=src_mes
00401363  rep movs dword ptr es:[edi], dword ptr [esi]              // esi=00403078 edi=0060fed4, des_mes="S{{p4c{f.4m{a4ufq4sq``}zs4}`5"
00401365  mov     eax, esi                                          // eax=00403078
00401367  mov     edx, edi                                          // edx=0060fed4
00401369  movzx   ecx, word ptr [eax]                               // ecx=[eax]=49h
0040136c  mov     word ptr [edx], cx                                // [edx]=49h 
0040136f  add     edx, 2                                            // edx=0060fed6
00401372  add     eax, 2                                            // eax=0040307a
00401375  mov     dword ptr [esp+74h], 0                            // [esp+74h]~[0060fee4]=0
0040137d  mov     dword ptr [esp+70h], 0                            // [esp+70h]~[0060fee0]=0
00401385  mov     dword ptr [esp], offset Secret+0x3024 (00403024)  // [esp] = 00403024, [00403024] = "Magic word:"
00640138c call    Secret+0x1c98 (00401c98)                          // call msvcrt!printf, print "Magic word:"
		   
00401391  mov     eax, dword ptr [Secret+0x6130 (00406130)]         // eax=[00406130]=767446h
00401396  mov     dword ptr [esp+8], eax							// [esp+8]~[0060fe78]=767446h
0040139a  mov     dword ptr [esp+4], 0Ah							// [esp+4]~[0060fe74]=0Ah
004013a2  lea     eax, [esp+66h]									// eax=input, # [esp+66h]~0060fed6~input
004013a6  mov     dword ptr [esp], eax								// [esp]=input
004013a9  call    Secret+0x1ca0 (00401ca0)							// call msvcrt!fgets
		  
004013ae  lea     eax, [esp+66h]									// eax=input 
004013b2  mov     dword ptr [esp], eax
004013b5  call    Secret+0x1ca8 (00401ca8)							// call msvcrt!strlen, eax=len(input)
		  
004013ba  cmp     eax, 3											// len(input) compare 3
004013bd  jbe     Secret+0x145b (0040145b)							// if eax<=3 goto block10

//block2-------------------------------------------------------
004013c3  mov     dword ptr [esp+7Ch], 1							// counter1=1, # [esp+7Ch]~[0060feec]~counter1 
004013cb  jmp     Secret+0x13e6 (004013e6)							// goto block4

//block3-------------------------------------------------------
004013cd  lea     edx, [esp+66h]          							// edx=input 
004013d1  mov     eax, dword ptr [esp+7Ch]							// eax=counter1
004013d5  add     eax, edx											// eax=counter1+input
004013d7  movzx   eax, byte ptr [eax]								// eax=000000@input[counter1],# (1..9)
004013da  movsx   eax, al											// eax=0000/1111@al
004013dd  add     dword ptr [esp+74h], eax							// sum=sum+eax, # [0060fee4]~sum 
004013e1  add     dword ptr [esp+7Ch], 1							// inc counter1, # 2=>3=>4=>5=>6=>7=>8=>9=>10

//block4-------------------------------------------------------	
004013e6  cmp     dword ptr [esp+7Ch], 9  							// counter1 compare to 9
004013eb  jle     Secret+0x13cd (004013cd)							// if counter1<=9 goto block3

//block5-------------------------------------------------------
004013ed  mov     eax, dword ptr [esp+74h]							// eax=sum, # sum need to be 866~362h
004013f1  sub     eax, 34Eh											// eax=sum-34Eh, # 20~14h~00010100b~key_value
004013f6  mov     dword ptr [esp+70h], eax							// key=eax, #[esp+70h]~[0060fee0]~key
004013fa  cmp     dword ptr [esp+70h], 14h							// key compare 14h
004013ff  jne     Secret+0x1454 (00401454)							// if eax!=14h goto block9

//block6-------------------------------------------------------
00401401  mov     dword ptr [esp+78h], 0							// [0060fee8]=0, # [esp+78h]~[0060fee8]~counter2
00401409  jmp     Secret+0x142f (0040142f)							// goto block8

//block7-------------------------------------------------------
0040140b  lea     edx, [esp+20h]									// edx=des_mes
0040140f  mov     eax, dword ptr [esp+78h]							// eax=counter2
00401413  add     eax, edx											// eax=des_mes+counter2
00401415  movzx   edx, byte ptr [eax]								// edx=000000@des_mes[counter2]
00401418  mov     eax, dword ptr [esp+70h]							// eax=key_value
0040141c  xor     eax, edx											// eax = (key_value xor 000000@des_mes[counter2])
0040141e  lea     ecx, [esp+20h]									// ecx=des_mes
00401422  mov     edx, dword ptr [esp+78h]							// edx=counter2
00401426  add     edx, ecx											// edx=counter2+des_mes
00401428  mov     byte ptr [edx], al								// des_mes[counter2]=al
0040142a  add     dword ptr [esp+78h], 1							// inc counter2

//block8-------------------------------------------------------
0040142f  mov     ebx, dword ptr [esp+78h]							// ebx=counter2
00401433  lea     eax, [esp+20h]									// eax=des_mes
00401437  mov     dword ptr [esp], eax								// [esp]=des_mes
0040143a  call    Secret+0x1ca8 (00401ca8)							// call msvcrt!strlen, eax=len(des_mes)
																	   
0040143f  cmp     ebx, eax											// counter2 compare len(des_mes) 
00401441  jb      Secret+0x140b (0040140b)							// if ebx<eax goto block7 

//block9-------------------------------------------------------
00401443  lea     eax, [esp+20h]									// eax=des_mes
00401447  mov     dword ptr [esp], eax								// [esp]=des_mes
0040144a  call    Secret+0x1cb0 (00401cb0)							// call msvcrt!puts
0040144f  call    Secret+0x1c60 (00401c60)							// call msvcrt!_getch

//block10------------------------------------------------------
00401454  mov     eax, 0											// eax=0
00401459  jmp     Secret+0x1460 (00401460)							// goto block12

//block11------------------------------------------------------
0040145b  mov     eax, 0											// eax=0

//block12------------------------------------------------------
00401460  lea     esp, [ebp-0Ch]
00401463  pop     ebx
00401464  pop     esi
00401465  pop     edi
00401466  pop     ebp
00401467  ret 

//end main