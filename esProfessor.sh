#!/bin/bash
clear
dados="dados.txt"
echo "1) NºProfessores"
echo "2) Alunos por professor"
echo "3) Média de alunos por professor"
echo "4) Professor com mais alunos"
echo "5) Quit"
read opt
    case $opt in
        1)  
            clear
            echo 'Número de Professores Registados :'
            awk '($1+0)>=40000 && ($1+0)<=49999' dados.txt | wc -l                  # Pesquisar valores dentro do intervalo
            echo $'\n\nPressione [ENTER] para avançar.\n'                           
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
        2)  
            clear
            echo 'Coloque ID do Professor'
            read ID
            if [ grep $ID $dados -eq -1 ] || [ $ID -gt 49999 ] || [ $ID -lt 40000 ]; # Se ID não existe na base de dados ou o número não está dentro do intervalo reservado
            then
                clear
                echo "Erro!! Professor não encontrado!"
            else
                clear
                nome=$(grep $ID $dados| cut -d , -f 2)                              # Procurar linhas com esse valo na posição 2 do input de professores
                echo "Nº de alunos associados ao professor(a) $nome"
                valor=$(grep -o "$nome:" $dados |  wc -l)
                echo $valor  
            fi     
            echo $'\n\nPressione [ENTER] para avançar.\n'
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
        3)
            clear
            alunos=$(grep -c : $dados)                                              # Contar número de alunos
            profs=$(grep -c , $dados)                                               # Contar número de professores
            echo "Média de alunos por professor"
            echo $((alunos/ profs))                                                 # Obter valor da média
            echo $'\n\nPressione [ENTER] para avançar.\n'                           
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;
        
        4)
            Arraytot=()
            ArrayID=()
            ID=40000
            while ! grep -q $ID $dados;
            do
            
                nome=$(grep $ID $dados| cut -d , -f 2)                              # Procurar linhas com esse valo na posição 2 do input de professores
                echo "Nº de alunos associados ao professor(a) $nome"
                valor=$(grep -o "$nome:" $dados |  wc -l)
                ArrayID+=$ID
                Arraytot+=$valor
                ID=$(($ID+1))
            done
            echo $ID
            pos=0
            max=${Arraytot[0]}
            for n in "${ArrayTot[@]}" ; do
                if $n > $max 
                then
                    max=$n ;
                    pos=n;
                fi
            done
            echo $max
            echo $'\n\nPressione [ENTER] para avançar.\n'                           
            read rand
            echo $'\n'
            clear
            ./esProfessor.sh;;        
        5)  clear
            ./mEstatisticas.sh;;
        *) echo $'\n\nOpção inválida.\nPressione [ENTER] para avançar.\n'           # Evitar outros inputs não existentes no menu
            read rand
            echo $'\n'
            clear
            ./mProfessor.sh;;
    esac





