// Segmento de codigo
.text
    // Tabela de vetor de interrupcao
    init:
        bun main
        nop
        reti
        .align 5
    // Dependencia de dados em registrador
    reg:
        // Operacoes aleatorias
        mov r1, 0x1234
        subi r2, r1, 4
        mul r4, r3, r2, r1
        sll r6, r5, r4, 2
        div r7, r5, r6
        sbr sr[1]
        divi r7, r5, 0
        modi r7, r5, 0
        push sr, r7, r8, r9, r10
        pop r10, r9, r8, r7, sr
        addi r10, r10, 1
        // Retorno da funcao
        ret
    // Dependencia de dados em memoria
    mem:
        // Operacoes aleatorias
        s8 [teste], r1
        l32 r2, [teste]
        s16 [teste], r1
        nop
        l32 r2, [teste]
        s16 [teste], r1
        l8 r2, [teste]
        s32 [teste], r1
        l16 r2, [teste + 1]
        cmpi r2, 0
        bne 0
        // Retorno da funcao
        ret
    // Funcao principal
    main:
        // SP = 32 KiB
        mov sp, 0x7FFC
        // Chamadas de funcoes
        call [reg]
        call mem
        // Finalizacao de execucao
        int 0
// Segmento de dados
.data
    // Variavel de teste
    teste:
        .4byte 0