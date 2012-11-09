#!/bin/bash
clr=$(clear) #clearing the screen
$clr
txtrst=$(tput sgr0) # Text reset
txtred=$(tput setaf 1) # Red
txtgrn=$(tput setaf 2) # Green
txtylw=$(tput setaf 3) # Yellow
txtblu=$(tput setaf 4) # Blue
txtpur=$(tput setaf 5) # Purple
txtcyn=$(tput setaf 6) # Cyan
txtwht=$(tput setaf 7) # White
bold=$(tput bold) #bold style
dim= $(tput dim) #: turn on half-bright mode
undl=$(tput smul) #: begin underline mode
exundl=$(tput rmul) #: exit underline mode
rev=$(tput rev) #: Turn on reverse mode
std=$(tput smso) #: Enter standout mode
exstd=$(tput rmso) #: Exit standout mode
# all modes are from 1 to 7
back=$(tput setb [4]) #: Set a background colour
fore=$(tput setf [2]) #: Set a foreground colour
sleep=`echo sleep 1`
#$clr
like=`cat li`
unlike=`cat unli`
exi()
{
$clr
kdialog --title "ProjectBingo Magic Shell" \
--warningyesnocancel "Are you sure you want to exit"
l=$?
case $l in
1)
start;;
0)
kdialog --title "ProjectBingo Magic Shell" --warningyesnocancel \
"\n Do you like the project ?"
y=$?
case $y in
1) echo "${txtgrn}${bold}Sorry , we were not able to come up to your expectations . Do write the suggestions on How to improve it in comment Section${txtrst}"
unlike=$((unlike+1))
`echo "$unlike">unli`
$sleep
$sleep;;
0)echo "${txtylw}${bold}Thank you for supporting us and raising our confidence.We'll try to always make your life simpler and happy${txtrst}"
like=$((like+1))
$sleep
$sleep
`echo "$like">li`;;
2);;
esac
$sleep
$sleep
$clr
echo "${txtylw}${bold}Please enter your e-mail id\n${txtrst}"
read email
ssmtp $email < mail.txt
$clr
echo "${txtred} Please enter the suggestions and your valuable comments which will indeed help in making BINGO SHELL a success in future  ${txtrst} "
read comment
cat personal1.txt > personal.txt
echo "$comment by $answer and his email id is $email">>personal.txt
ssmtp "tusharmakkar08@gmail.com"<personal.txt
`echo $comment>>comment.txt`
`echo "by $answer\n">>comment.txt`
echo "${txtgrn} ${bold}We will look into your suggestions and comment and will try to work on it and improve it in next version ${txtrst}"
echo "${txtpur} ${bold} ${undl}---------------------------Thank you for using Bingo shell ... :)----------------------${exundl} ${txtrst} "
$sleepi
$sleep
$sleep
$sleep
$clr
exit;;
2)start;;
esac
}
$clr
kdialog --title "BINGO SHELL" --msgbox "Welcome to the amazing world of BINGO Interactive GUI shell \n " 
kdialog --title "BINGO SHELL" --warningyesnocancel " \n Do you want to login ?"
i=$?
f=0
case $i in
0)
$clr
t()
{
password=`kdialog --password "Enter the password"`
if [ "$password" -eq "12345" ]
then
kdialog --msgbox "Password correct.\n Going to shell"
answer="Tushar Makkar"
f=0
else
$clr
kdialog --sorry "Password incorrect.\n Try again"
t
fi
}
t;;
*)
$clr
kdialog --title "Input dialog" --inputbox "What name would you like to
use" "Anonymous">answer
f=1
;;
esac
start()
{
$clr
echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell !!!${exundl}     ${txtrst}"
$sleep
echo "\n\n${txtylw}${bold}${rev}No. of likes = $like ${txtrst}"
echo "\n"
if [ "$f" -eq "1" ]
then
answer="`cat answer`"
fi
echo "${bold} Hi $answer  Hope your stay with us will be problem free ${txtrst}"
i=0
while [ $i -le 0 ]
do
echo 
i=$((i+1))
done
echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
echo "${txtcyn} 1--- File and Directory management commands " 
echo "${txtcyn} 2--- Text processing commands " 
echo "${txtcyn} 3--- System status commands " 
echo "${txtcyn} 4--- Games " 
echo "${txtcyn} 5--- Internet Speed Dial "
echo "${txtcyn} 6--- Help regarding commands" 
echo "${txtcyn} 7--- Exit  "
echo " 8--- For opening simple terminal "
echo "\n\n\n${txtylw}${bold} Write bingo to  See what other users have to say about this product\n ${txtrst}"
read a
case $a in
1)dir()
{
$clr
       $sleep
        echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell File and Directory Page  !!!${exundl}     ${txtrst}"
        echo ""
        echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
        echo "${txtcyn}1--- Display the contents of the file " 
        echo "${txtcyn}2--- Remove the file "
	 echo "${txtcyn}3--- List the file "
	 echo "${txtcyn}4--- Size of the file "
	 echo "${txtcyn}5--- Go back to the main menu "
	 echo "${txtcyn}6--- Exit the file ${txtrst}"
	read file
	case $file in
		1)$clr
		 $sleep
		echo "${txtcyn}Enter filename${txtrst}"
		read filen
		$(gedit $filen)
$sleep
$sleep
$sleep
dir;;
		2)$clr
                 $sleep
                echo "${txtcyn}Enter filename${txtrst}"
                read filen
                $(rm $filen)
		echo "${txtred}$filen deleted successfully${txtrst} "

$sleep
$sleep
$sleep
dir
;;
		3)$clr
                 $sleep
                for i in `ls -a `
		do
		echo $i
		done 
$sleep
$sleep
$sleep
dir;;
		4)for i in `ls -l`
do
echo $i
done 
$sleep
$sleep
$sleep
$sleep
dir	;;
		5)start	;;
		6)$clr
exi;;
	esac
}
dir
;;
2)status(){
$clr
       $sleep
        echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell Text Processing  Page  !!!${exundl}     ${txtrst}"
        echo ""
        echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
        echo "${txtcyn}1--- Search for a file " 
        echo "${txtcyn}2--- Count lines,words, and charachters in specified files "
        echo "${txtcyn}3--- Go to the main menu "
	echo "${txtcyn}4--- Exit ${txtrst}"
	read fi
	case $fi in
	1)echo "${bold} Enter file name${txtrst}"
read file
echo $file
if [ -e $file ]
then
echo "${txtblu}file is found\nDo you want to open the file press 1 for Yes \n  ${txtrst}"
read k
if [ "$k" -eq "1" ]
then
gedit $file
fi
else
echo "${txtblu}File not found \n ${txtrst} "
fi
$sleep
$sleep
$sleep
status;;
	2)
echo "${bold}Enter file name${txtrst}"
read file
if [ -e $file ]
then
wc $file
else
echo "${txtblu}File not found \n${txtrst} "
fi
$sleep
$sleep
$sleep
status;;
	3)start	;;
	4)$clr
exi;;
esac
}
status;;
3)syst()
{
$clr
       $sleep
        echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell System Status Page  !!!${exundl}     ${txtrst}"
        echo ""
        echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
        echo "${txtcyn}1--- Display the current date and time  " 
        echo "${txtcyn}2--- Current disk usage "
	echo "${txtcyn}3--- Display process status information "
        echo "${txtcyn}4--- Go to the main menu "
        echo "${txtcyn}5--- Exit ${txtrst}"
        read fsi
        case $fsi in
        1)
date
$sleep
$sleep
$sleep
syst
;;
        2)
df
$sleep
$sleep
$sleep
$sleep
syst
;;
	3)
ps
$sleep
$sleep
$sleep
$sleep
syst
;;
        4)start ;;
        5)$clr
exi;;
esac
}
syst
;;
4)maingame()
{
	$clr
	$sleep
	echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell Game Page  !!!${exundl}     ${txtrst}"
	echo ""
	echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
	echo "${txtcyn} 1--- UNIX WONDERS " 
	echo "${txtcyn} 2--- MOTHER CALLING "
	echo "${txtcyn} 3--- GO back to the main menu ${txtrst} "
	echo ""
	read c
	case $c in
		1)
		game1()
{	
		 $clr
                $sleep
                echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to UNIX WONDERS  !!!${exundl}     ${txtrst}"
                echo " "
		echo "${txtred}${bold} Which command you  want to learn today ?${txtrst} "
		echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
		echo "${txtcyn} 1--- ls " 
		echo "${txtcyn} 2--- date "
		echo "${txtcyn} 3--- pwd "
		echo "${txtcyn} 4--- Go back to main page "
		echo "${txtcyn} 5--- Exit ${txtrst}"
		read input
		case $input in
			1)game()
{
				$clr $sleep
				echo "${txtgrn} ${bold}ls command${txtrst} "
				echo ""
				echo "${bold}                        ${undl}Use of ls${exundl}  "
				echo "${txtblu} It lists the contents of directory ... Try it yourself${txtrst} "
				read c
				case $c in 
				ls)
				echo "\n\n"
				for i in `ls`
               			do
               				 echo $i
                		done;;
				*)
				echo "\n\n"
                                echo "${txtred}${bold}You have written it wrongly try again ${txtrst}"
                                $sleep
				$sleep
				game;;
				esac	
                            
				$sleep
				$sleep
				$clr
				echo "${txtylw} ${bold}WELL DONE ${txtrst}"
				echo "${txtblu} Congratulations You have learnt ls command ${txtrst}"

$sleep
$sleep
game1
}
game
$sleep
$sleep
$clr
exi;;
		2)game()
{
		$clr
		$sleep
		  echo "${txtgrn} ${bold}date command${txtrst} "
                                echo ""
                                echo "${bold}                        ${undl}Use of date${exundl}  "
                                echo "${txtblu} It displays the date and time of the system clock..... Try it yourself${txtrst} "
                                read c
                            case $c in
"date")echo "\n\n"
                     		date;;
                               
                                *)
				echo "\n\n"
				$sleep
				$sleep
                                echo "${txtred}${bold}You have written it wrongly try again${txtrst} "
                               	$sleep
				$sleep
				 game;;
esac
                                $sleep
                                $sleep
                                $clr
                                echo "${txtylw} ${bold}WELL DONE ${txtrst}"
  				  echo "${txtblu} Congratulations You have learnt date command ${txtrst}"
$sleep
$sleep     
game1                         
}
game
$sleep
$sleep
$clr
exi		;;
		3)
game()
{
                $clr
                $sleep
                  echo "${txtgrn} ${bold}pwd command${txtrst} "
                                echo ""
                                echo "${bold}                        ${undl}Use of pwd${exundl}  "
                                echo "${txtblu} It displays the name for current working directory..... Try it yourself${txtrst} "
                                read c
                                case $c in 
                               	pwd)
				echo "\n"
                                	pwd;;
                                
                               *)
                                echo "${txtred}${bold}You have written it wrongly try again${txtrst} "
                                $sleep
				$sleep
				$sleep
				game;;
             esac
                                $sleep
                                $sleep
                                echo "${txtylw} ${bold}WELL DONE ${txtrst}"
				$sleep
                                $clr
                                echo "${txtblu} Congratulations You have learnt pwd command ${txtrst}"
$sleep
$sleep
game1
}
game
$clr
exi
;;
		4)start;;
		5)
exi;;
*)$clr
echo "${bold}${txtred}Invalid Option${txtrst}"
$sleep
$sleep
$sleep
game1 ;;
		esac
}
game1;;
		2)game2()
{ $clr 
		$sleep
		echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to MOTHER CALLING  !!!${exundl}     ${txtrst}"
		$sleep
		$sleep
	kdialog --title "ProjectBingo Magic Shell" --warningyesnocancel \
	"\n Do you want to play it ?"
	y=$?
	case $y in
	1)maingame;;
	0);;
	2)start;;
	esac
		echo "${txtblu} Modern technology owes ecology an apology! 
		This is what some people say when the read the news about haze, deforestation, extinction of flora and fauna and global warming. They blame modern technology, the materials and ideas developed in the last century to assist humans in their activities, for the deterioration of ecology. The ecological cycle has been very much disturbed by the developments humankind have achieved. Despite these allegations, we should stop and think, does modern technology really owe ecology an apology? For what reason does it owe ecology an apology? Is it because it took away its attractiveness and reduced attention and respect to nature?s beauty? Is it because it harmed the environment? Has all modern technology harmed Mother Nature? I think modern technology does owe ecology an apology as some but not all of it has negatively affected the ecology. 
		${txtrst} "
		echo "${txtred} ${bold}Do you want to save Mother earth ????\nPress y for yes and n for No ${txtrst}"
		read d 
		case $d in
			y) $clr
			echo "${txtblu}You have made the right decision ...
*)Plant a Birthday tree
*)Use Energy saving appliances
*)Reduce-Reuse-Recycle
*)Avoid Food wastage
*)Drive Less, Drive Smart			 ${txtrst}"
echo "${txtpur} ${bold} ${back} ${undl}Thank you for playing MOTHER EARTH ... :)${exundl} ${txtrst} "
$sleep
$sleep
$sleep
$clr
game2
;;
			n) $clr 
			echo "${txtblu} We feel sorry you have no obligations towards Mother Earth ...Your future is in dark...${txtrst}"
			${sleep}
			${sleep}
			${sleep}
			game2;;
		esac
}
game2;;
		3)  start;;
*)$clr
echo "${bold}${txtred}Invalid Option${txtrst}"
$sleep
$sleep
$sleep
maingame;;
	esac
}
maingame;;
5)internet()
{
	$clr
	$sleep
	echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell Internet page  !!!${exundl}     ${txtrst}"
	echo ""
	echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
	echo "${txtcyn} 1--- Facebook " 
	echo "${txtcyn} 2--- Google " 
	echo "${txtcyn} 3--- Yahoo "
	echo "${txtcyn} 4--- Gmail "
	echo "${txtcyn} 5--- Duck Duck Go "
	echo " 6--- Some adult web site"
	echo "${txtcyn} 7--- Any other Site "
	echo " 8--- Go back to previous menu "
	echo "${txtcyn} 9--- Exit ${txtrst}"
	read b
	case $b in
		1) `echo firefox 'http://facebook.com'`
	internet		;;
		2) `echo firefox 'http://www.google.com'`
	internet
	;;
		3) `echo firefox 'www.yahoo.com'`
	internet
	;;
		4) `echo firefox 'www.gmail.com'`
	internet
	;;
		5) `echo firefox 'www.duckduckgo.com'`
	internet
	;;
		6)export birthday=`zenity --calendar --text='When is your
	birthday?' --title='DETAILS TABLE'>kot`
	kot=`cat kot`
	l=`echo $kot|cut -d '/' -f 3`
	v=$((2012-l))
	if [ $v -gt 19 ]
	then
	echo "${bold} ${txtred} Access Granted\n ${txtrst}"
	echo "${txtcyn} Enter site \n ${txtrst}"
	read site
	`echo firefox $site`
	else
	echo "${bold} ${txtred} Access Denied\n ${txtrst}"
	fi
$sleep
$sleep
$sleep
	internet
	;;
		7)  echo "${txtcyn} Enter new site
			${txtrst}" 
			read site
			`echo firefox $site`;;
		8)start;;	
	9)$clr
	exi;;
esac
}
internet;;
6)hel(){
$clr
$sleep
echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell Help page  !!!${exundl}     ${txtrst}"
echo ""
echo "${txtred} ${rev} ${bold} Enter 1 for command help and 2 for exit ${txtrst} "
read c
case $c in
1)
$clr
$sleep
echo "${txtylw}${rev}${bold}Enter your command${txtrst}"
read cmd
$clr
$sleep
man $cmd
hel;;
2)
exi;;
*)
$clr
echo "${txtred}${bold}Invalid Option${txtrst}"
$sleep
$sleep
hel;;
esac
$sleep
$sleep
}
hel;;
7)
exi;;
bingo)$clr
echo "${txtylw}${bold}Here are some of the comments by our users\n\n${txtrst}"
cat comment.txt
$sleep
$sleep
$sleep
$sleep
$sleep
$sleep
start;;
8)x-terminal-emulator
$sleep
$sleep
start;;
*) $clr
echo "${txtred}${bold}Please Enter Correct option${txtrst}"
$sleep
$sleep
$clr
start;;
esac
}
start
