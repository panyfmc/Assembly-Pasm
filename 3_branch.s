// Segmento de codigo
.text
    // Tabela de vetor de interrupcao
    init:
        bun main
        .align 5
    // Multiplicacao de vetor
    mul_vec:
        // i = 0
        mov r4, 0
        bun 5
        // V[i]
        add r5, r4, r1
        // V[i] = V[i] * k
        l32 r6, [r5]
        mul r7, r6, r3
        s32 [r5], r7
        // i++
        addi r4, r4, 1
        // i < n
        cmp r4, r2
        blt -7
        // Retorno da funcao
        ret
    // Funcao principal
    main:
        // SP = 32 KiB
        mov sp, 0x7FFC
        // Ajustando parametros (r1 = V, r2 = n, r3 = k)
        mov r1, V
        mov r2, 100
        mov r3, 42
        // Chamadas de funcao
        call mul_vec
        // Finalizacao de execucao
        int 0
// Segmento de dados
.data
    // Vetor
    V:
        .fill 100, 4, 1
