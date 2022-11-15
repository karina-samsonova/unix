#!/bin/bash
function greetings()
{
echo "welcome to my calculator!"
echo "right patterns for numbers:"
echo "0: [Nn][YyUuOo0][Ll] (examples: nYl,NoL)"
echo "1: [AaOo0][DdTt][YyIiEe][Nn] (examples: OdyN,adiN)"
echo "2: [DdTt][VvFf][Aa] (examples: DVA,dfA)"
echo "3: [TtDd][RrLl][IiEe] (examples: TRi,tre)"
echo "4: [Cc][Hh]?[EeIi][Tt][YyIiEe][RrLl][EeIi] (examples: Chityri,cetiri)"
echo "5: [Pp][YyIiEe]?[Aa][Tt] (examples: pyaT,Peat)"
echo "6: [Ss][Hh]?[EeIi][SsZz][Tt] (examples: SeSt,shezt)"
echo "7: [SsCc][EeIi][Mm] (examples: CEM,SiM)"
echo "8: [VvFf][Oo0][SsZzCc][EeIi][Mm] (examples: VOseM,f0cim)"
echo "9: [DdTt][Ee][VvFf][YyIiEe]?[Aa][TtDd] (examples: dEvyaT,DEVIAT)"
echo "right patterns for signs:"
echo "-: [Mm][IiEe][Nn][UuYy][SsZzCc] (examples: MENYC,Minus)"
echo "+: [Pp][Ll][YyUu][SsCcZz] (examples: Pluz,PLYS)"
echo "*: [YyUu][Mm][Nn][Oo0][GgJj][Hh]?[IiEe][Tt] (examples: YMnogit,umnojhet)"
echo "/: [Dd][EeIi][Ll][IiEe][Tt] (examples: delit,DILIT)"
echo "enter 'otpustite' to exit"
}
a=""
b=""
function numbers()
{
	b=$(echo $1 | awk '/^[Nn][YyUuOo0][Ll]$/{print "0"}')
	if [ -z "$b" ]
	then
		b=$(echo $1 | awk '/^[AaOo0][DdTt][YyIiEe][Nn]$/{print "1"}')
	fi
	if [ -z "$b" ]
	then
		b=$(echo $1 | awk '/^[DdTt][VvFf][Aa]$/{print "2"}')
	fi
	if [ -z "$b" ]
	then
		b=$(echo $1 | awk '/^[TtDd][RrLl][IiEe]$/{print "3"}')
	fi
	if [ -z "$b" ]
	then
		b=$(echo $1 | awk '/^[Cc][Hh]?[EeIi][Tt][YyIiEe][RrLl][EeIi]$/{print "4"}')
	fi
	if [ -z "$b" ]
	then
		b=$(echo $1 | awk '/^[Pp][YyIiEe]?[Aa][Tt]$/{print "5"}')
	fi
	if [ -z "$b" ]
	then
		b=$(echo $1 | awk '/^[Ss][Hh]?[EeIi][SsZz][Tt]$/{print "6"}')
	fi
	if [ -z "$b" ]
	then
		b=$(echo $1 | awk '/^[SsCc][EeIi][Mm]$/{print "7"}')
	fi
	if [ -z "$b" ]
	then
		b=$(echo $1 | awk '/^[VvFf][Oo0][SsZzCc][EeIi][Mm]$/{print "8"}')
	fi
	if [ -z "$b" ]
	then
		b=$(echo $1 | awk '/^[DdTt][Ee][VvFf][YyIiEe]?[Aa][TtDd]$/{print "9"}')
	fi
	if [ -z "$b" ]
	then
		echo "learn how to write!"
		return 1
	fi
	return 0
}
function sign()
{
	s=""
	s=$(echo $1 | awk '/^[Mm][IiEe][Nn][UuYy][SsZzCc]$/{print "-"}')
	if [ -n "$s" ]
	then
		echo "result = "$(expr $2 - $3)
		return
	fi
	s=$(echo $1 | awk '/^[Pp][Ll][YyUu][SsCcZz]$/{print "+"}')
	if [ -n "$s" ]
	then
		echo "result = "$(expr $2 + $3)
		return
	fi
	s=$(echo $1 | awk '/^[YyUu][Mm][Nn][Oo0][GgJj][Hh]?[IiEe][Tt]$/{print "*"}')
	if [ -n "$s" ]
	then
		echo "result = "$(expr $2 \* $3)
		return
	fi
	s=$(echo $1 | awk '/^[Dd][EeIi][Ll][EeIi][Tt]$/{print "/"}')
	if [ -n "$s" ]
	then
		if [ $(expr $2 % $3) -eq 0 ]
		then
			echo "result = "$(expr $2 / $3)
		else
			echo "result = "$(expr $2 / $3)"("$(expr $2 % $3)")"
		fi
		return
	fi
	echo "learn how to write!"
	return
}
while true
do
	greetings
	echo "enter the first number:"
	read var
	if [ $var = "otpustite" ]
	then
		break
	fi
	numbers $var
	if [ $? -eq 0 ]
	then
		a=$b
		b=""
		echo "enter the second number:"
		read var
		if [ $var = "otpustite" ]
		then
			break
		fi
		numbers $var
		if [ $? -eq 0 ]
		then
			echo "enter the sign:"
			read var
			if [ $var = "otpustite" ]
			then
				break
			fi
			sign $var $a $b
		fi
	fi
	echo 
done
