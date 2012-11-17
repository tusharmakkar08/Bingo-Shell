#!/bin/bash
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
cd /home/tushar/Unix*
clear
sleep=`echo sleep 1`
like=`cat li`
unlike=`cat unli`
exi()
{
clear
kdialog --title "ProjectBingo Magic Shell" \
--warningyesnocancel "Are you sure you want to exit"
l=$?
case $l in
1)
start;;
0)
clear
kdialog --title "ProjectBingo Magic Shell" --warningyesnocancel \
"\n Do you like the project ?"
y=$?
clear
case $y in
1) echo -e "${txtgrn}${bold}Sorry , we were not able to come up to your expectations . Do write the suggestions on How to improve it in comment Section${txtrst}"
unlike=$((unlike+1))
`echo -e "$unlike">unli`
$sleep;;
0)echo -e "${txtylw}${bold}Thank you for supporting us and raising our confidence.We'll try to always make your life simpler and happy${txtrst}"
like=$((like+1))
$sleep
$sleep
`echo -e "$like">li`;;
2);;
esac
$sleep
clear
echo -e "${txtylw}${bold}Please enter your e-mail id\n${txtrst}"
read email
ssmtp $email < mail.txt
clear
echo -e "${txtred}${bold} Please enter the suggestions and your valuable comments which will indeed help in making BINGO SHELL a success in future  ${txtrst} "
read comment
cat personal1.txt > personal.txt
echo -e "$comment by $answer and his email id is $email">>personal.txt
ssmtp "tusharmakkar08@gmail.com"<personal.txt
`echo $comment>>comment.txt`
`echo -e "by $answer\n">>comment.txt`
echo -e "${txtgrn} ${bold}We will look into your suggestions and comment and will try to work on it and improve it in next version ${txtrst}"
echo -e "${txtpur} ${bold} ${undl}---------------------------Thank you for using Bingo shell ... :)----------------------${exundl} ${txtrst} "
echo "Do remember"|festival --tts
echo "Happiness is yelling Bingo"|festival --tts
$sleep
echo "Thank you for using Bingo Shell"|festival --tts
$sleep
$sleep
$sleep
$sleep
clear
exit;;
2)start;;
esac
}

clear
kdialog --title "BINGO SHELL" --msgbox "Welcome to the amazing world of BINGO Interactive GUI shell \n " 
kdialog --title "BINGO SHELL" --warningyesnocancel " \n Do you want to login ?"
i=$?
clear
f=0
case $i in
0)
clear
t()
{
password=`kdialog --password "Enter the password"`
clear
if [ "$password" -eq "12345" ]
then
kdialog --msgbox "Password correct.\n Going to shell"
clear
answer="Tushar Makkar"
f=0
else
clear
kdialog --sorry "Password incorrect.\n Try again"
clear
t
clear
fi
}
t;;

*)
clear
kdialog --title "Input dialog" --inputbox "What name would you like to
use" "Anonymous">answer
clear
f=1
;;
esac
if [ "$f" -eq "1" ]
then
answer="`cat answer`"
fi

ssil()
{
clear
echo -e "\n\t${txtred}${bold}Hi $answer Enter your Location${txtrst}\n"
echo "Hi $answer Enter your location"|festival --tts
echo "${txtcyn}${bold} 1--- New Delhi"
echo "${txtcyn}${bold} 2--- Tiruchchirapalli "
echo "${txtcyn}${bold} 3--- Hyderabad"
echo "${txtcyn}${bold} 4--- Madras"
echo "${txtcyn}${bold} 5--- Amritsar"
echo "${txtcyn}${bold} 6--- Calcutta"
echo "${txtcyn}${bold} 7--- Jaipur"
echo "${txtcyn}${bold} 8--- Patna${txtrst}"
read wea
case $wea in
1)temp=`weather -iVIDP | awk '/Temperature/ {print $4}' | \
awk -F "(" '{print $2}'`
;;
2)temp=`weather -iVOTR | awk '/Temperature/ {print $4}' | \
awk -F "(" '{print $2}'`
;;
3)temp=`weather -iVOHY | awk '/Temperature/ {print $4}' | \
awk -F "(" '{print $2}'`
;;
4)temp=`weather -iVOMM | awk '/Temperature/ {print $4}' | \
awk -F "(" '{print $2}'`
;;
5)temp=`weather -iVIAR | awk '/Temperature/ {print $4}' | \
awk -F "(" '{print $2}'`
;;
6)temp=`weather -iVECC | awk '/Temperature/ {print $4}' | \
awk -F "(" '{print $2}'`
;;
7)temp=`weather -iVIJP | awk '/Temperature/ {print $4}' | \
awk -F "(" '{print $2}'`
;;
8)temp=`weather -iVEPT | awk '/Temperature/ {print $4}' | \
awk -F "(" '{print $2}'`
;;
*)
clear
echo -e "\n\t${txtred}${bold}Invalid option${txtrst}\n"
$sleep
$sleep
ssil;;
esac
}
ssil
adi=0
start()
{
clear
echo -e  "\n\t\t${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell !!!${exundl}     ${txtrst}"
if [ $adi -eq 0 ]
then
echo "Welcome to Bingo Shell"|festival --tts
fi
echo -e "\n\n"
echo "${bold}${txtylw}Do Remember : Happiness is Yelling Bingo ...${txtrst}"
if [ $adi -eq 0 ]
then
echo "Do Remember :: Happiness is Yelling Bingo..."|festival --tts
fi
echo -e "\n\t${txtylw}${bold}${rev}No. of likes = $like ${txtrst}"
echo -e "\n"
echo -e "${bold} Hi $answer  Hope your stay with us will be problem free ${txtrst}"
if [ $adi -eq 0 ]
then
echo "Hi $answer Hope your stay with us will be problem free "|festival --tts
fi
adi=$((adi+1))
echo -e "\n"
if [ $temp -ge 30 ]
then
echo "${txtylw}${bold}I am sweating badly.. Don't you ?? Temperature in your area is $temp degree celsius"
elif [ $temp -ge 25 ]
then
echo "${txtylw}${bold} I am feeling dry Don't you ??..  Temperature in your area is $temp degree celsius"
elif [ $temp -ge 20 ]
then
echo "${txtylw}${ylw} I am able to smell the spring flowers :) .. Temperature in your area is $temp degree celsius"
elif [ $temp -ge 10 ]
then
echo "${txtylw}${bold}I am enjoying the pleasant weather. Don't you?? .. Temperature in your area is $temp degree celsius"
elif [ $temp -ge 0 ]
then
echo "${txtylw}${bold}I'm shivering .. Don't you ?? Temperature in your area is $temp degree celsius"
fi
echo -e "\n"
echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
echo "${txtcyn}${bold} 1--- File and Directory management commands " 
echo " 2--- Text processing commands " 
echo " 3--- System status commands " 
echo " 4--- Games " 
echo " 5--- Internet Speed Dial "
echo " 6--- Help regarding commands" 
echo " 7--- To know about the weather in your area "
echo " 8--- For opening simple terminal "
echo " 9--- For listening to awesome music "
echo " 10--- Exit "
echo -e "\n\n${txtylw}${bold} Write bingo to  See what other users have to say about this product\n ${txtrst}"
read a
case $a in
1)dir()
{
clear
       $sleep
        echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell File and Directory Page  !!!${exundl}     ${txtrst}"
        echo ""
	echo "Welcome to Bingo Shell File and Directory Page"|festival --tts
        echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
        echo "${txtcyn}${bold}1--- Display the contents of the file " 
        echo "${txtcyn}2--- Remove the file "
	 echo "${txtcyn}3--- List the file "
	 echo "${txtcyn}4--- Size of the file "
	echo "5--- Create a new file"
	 echo "${txtcyn}6--- Go back to the main menu "
	 echo "${txtcyn}7--- Exit  ${txtrst}"
	read file
	case $file in
		1)clear
		 $sleep
		echo "${txtcyn}${bold}Enter filename${txtrst}"
		read filen
		if [ -e $filen ]
		then
		$clear
		gedit filen
		$sleep
		$sleep
		else
		echo -e "${txtred}${bold}\n\nFILE NOT FOUND${txtrst}"
		fi
$sleep
$sleep
$sleep
dir;;
		2)clear
                 $sleep
                echo "${txtcyn}${bold}Enter filename${txtrst}"
                read filen
                $(rm $filen)
		echo "${txtred}${bold}$filen deleted successfully${txtrst} "

$sleep
$sleep
$sleep
dir
;;
		3)clear
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
5)cre()
{
	clear
                 $sleep
                echo "${txtcyn}${bold}Enter filename${txtrst}"
                read filen
                if [ -e $filen ]
                then
                echo -e "${txtred}${bold}\n\nFILE WITH SAME NAME IS ALREADY PRESENT${txtrst}"
                else
		$clr
                lsi(){
		clear
		echo -e "${txtylw}${bold}Which editor you want to open the file ?${txtrst}"
		  echo -e "${txtred} ${rev} ${bold}\n Enter your choice ${txtrst} "
        		echo "${txtcyn}${bold}1--- Gedit " 
  		      echo "${txtcyn}2--- VIM  "
  		       echo "${txtcyn}3--- Nano "
     		    echo "${txtcyn}4--- Emacs "
		echo "5--- Go back to the previous menu"
     	   	 echo "${txtcyn}6--- Go back to the main menu "
        	 echo "${txtcyn}7--- Exit ${txtrst}"
		read var
		case $var in
		1)gedit $var
		lsi	;;
		2)vi $var
	lsi	;;
		3)nano $var
	lsi	;;
		4)emacs $var
		lsi;;
		5)dir;;
		6)start;;
		7)exi;;
		*)echo -e "${txtred}${bold}INVALID OPTION${txtrst}"
		$sleep
		$sleep
		lsi;;
		esac
}
lsi
                fi
$sleep
$sleep
$sleep
dir
}
cre
;;
		6)start	;;
		7)clear
exi;;
*)echo 
 echo "${txtred}${bold}INVALID OPTION ${txtrst}"
$sleep
$sleep
dir;;
	esac
}
dir
;;
2)status(){
clear
       $sleep
        echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell Text Processing  Page  !!!${exundl}     ${txtrst}"
        echo ""
	echo "Welcome to Bingo Shell Text Processing Page"|festival --tts
        echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
        echo "${txtcyn}${bold}1--- Search for a file " 
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
echo -e "${txtblu}${bold}file is found\nDo you want to open the file press 1 for Yes \n  ${txtrst}"
read k
if [ "$k" -eq "1" ]
then
gedit $file
fi
else
echo -e "${txtblu}${bold}File not found \n ${txtrst} "
fi
$sleep
$sleep
$sleep
status;;
	2)
echo "${bold}${txtylw}Enter file name${txtrst}"
read file
if [ -e $file ]
then
wc $file
else
echo -e "${txtblu}${bold}File not found \n${txtrst} "
fi
$sleep
$sleep
$sleep
status;;
	3)start	;;
	4)clear
exi;;
*)echo 
 echo "${txtred}${bold}INVALID OPTION ${txtrst}"
$sleep
$sleep
status;;
esac
}
status;;
3)syst()
{
clear
       $sleep
        echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell System Status Page  !!!${exundl}     ${txtrst}"
        echo ""
	echo "Welcome to Bingo Shell System Status Page"|festival --tts
        echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
        echo "${txtcyn}${bold}1--- Display the current date and time  " 
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
        5)clear
exi;;
*)
echo 
 echo "${txtred}${bold}INVALID OPTION ${txtrst}"
$sleep
$sleep
syst;;
esac
}
syst
;;
4)maingame()
{
	clear
	$sleep
	echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell Game Page  !!!${exundl}     ${txtrst}"
	echo ""
	echo "Welcome to Bingo Shell Game page"|festival --tts
	echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
	echo "${txtcyn}${bold} 1--- UNIX WONDERS " 
	echo "${txtcyn} 2--- MOTHER CALLING "
	echo "${txtcyn} 3--- GO back to the main menu ${txtrst} "
	echo ""
	read c
	case $c in
		1)
		game1()
{	
		 clear
                $sleep
                echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to UNIX WONDERS  !!!${exundl}     ${txtrst}"
                echo " "
		echo "Welcome to UNIX WONDERS"|festival --tts
		echo "${txtred}${bold} Which command you  want to learn today ?${txtrst} "
		echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
		echo "${txtcyn}${bold} 1--- ls " 
		echo "${txtcyn} 2--- date "
		echo "${txtcyn} 3--- pwd "
		echo "${txtcyn} 4--- Go back to main page "
		echo " 5--- Go Back to game's page"
		echo "${txtcyn} 6--- Exit ${txtrst}"
		read input
		case $input in
			1)game()
{
				clear
 $sleep
				echo "${txtgrn} ${bold}ls command${txtrst} "
				echo ""
				echo "${bold}                        ${undl}Use of ls${exundl}  "
				echo "${txtblu}${bold}It lists the contents of directory ... Try it yourself${txtrst} "
				read c
				case $c in 
				ls)
				echo -e "\n\n"
				for i in `ls`
               			do
               				 echo $i
                		done;;
				*)
				echo -e "\n\n"
                                echo "${txtred}${bold}You have written it wrongly try again ${txtrst}"
                                $sleep
				$sleep
				game;;
				esac	
                            
				$sleep
				$sleep
				clear
				echo "${txtylw} ${bold}WELL DONE ${txtrst}"
				echo "${txtblu}${bold} Congratulations You have learnt ls command ${txtrst}"

$sleep
$sleep
game1
}
game
$sleep
$sleep
clear
exi;;
		2)game()
{
		clear
		$sleep
		  echo "${txtgrn} ${bold}date command${txtrst} "
                                echo ""
                                echo "${bold}                        ${undl}Use of date${exundl}  "
                                echo "${txtblu}${bold} It displays the date and time of the system clock..... Try it yourself${txtrst} "
                                read c
                            case $c in
"date")echo -e "\n\n"
                     		date;;
                               
                                *)
				echo -e "\n\n"
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
  				  echo "${txtblu}${bold} Congratulations You have learnt date command ${txtrst}"
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
                clear
                $sleep
                  echo "${txtgrn} ${bold}pwd command${txtrst} "
                                echo ""
                                echo "${bold}                        ${undl}Use of pwd${exundl}  "
                                echo "${txtblu}${bold} It displays the name for current working directory..... Try it yourself${txtrst} "
                                read c
                                case $c in 
                               	pwd)
				echo -e "\n"
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
                                clear
                                echo "${txtblu}${bold} Congratulations You have learnt pwd command ${txtrst}"
$sleep
$sleep
game1
}
game
clear
exi
;;
		4)start;;
5)maingame;;
		6)
exi;;
*)clear
echo "${bold}${txtred}Invalid Option${txtrst}"
$sleep
$sleep
$sleep
game1 ;;
		esac
}
game1;;
		2)game2()
{ clear
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
		clear
		echo -e "${txtcyn}${bold} Modern technology owes ecology an apology!\nThis is what some people say when the read the news about haze, deforestation, extinction of flora and fauna and global warming.\nThey blame modern technology, the materials and ideas developed in the last century to assist humans in their activities, for the deterioration of ecology.\nThe ecological cycle has been very much disturbed by the developments humankind have achieved.\nDespite these allegations, we should stop and think, does modern technology really owe ecology an apology?\nFor what reason does it owe ecology an apology?\nIs it because it took away its attractiveness and reduced attention and respect to nature's beauty?\nIs it because it harmed the environment?\nHas all modern technology harmed Mother Nature?\nI think modern technology does owe ecology an apology as some but not all of it has negatively affected the ecology. ${txtrst}"
		echo -e "\n\n"
		echo -e "${txtred}${bold}${rev}Do you want to save Mother earth ?Press y for yes and n for No ${txtrst}"
		read d 
		case $d in
			y) clear
			echo "You have made the right decision"|festival --tts
			echo "${txtylw}${bold}You have made the right decision ...
*)Plant a Birthday tree
*)Use Energy saving appliances
*)Reduce-Reuse-Recycle
*)Avoid Food wastage
*)Drive Less, Drive Smart			 ${txtrst}"
echo "${txtpur} ${bold} ${back} ${undl}Thank you for playing MOTHER EARTH ... :)${exundl} ${txtrst} "
$sleep
$sleep
$sleep
clear
game2
;;
			n) clear 
			echo "${txtred}${bold} We feel sorry you have no obligations towards Mother Earth ...Your future is in dark...${txtrst}"
			echo "You still can change your decision"|festival --tts
			${sleep}
			${sleep}
			${sleep}
			game2;;
		esac
}
game2;;
		3)  start;;
*)clear
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
	clear
	$sleep
	echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell Internet page  !!!${exundl}     ${txtrst}"
	echo ""
	echo "Welcome to Bingo Shell Internet Page"|festival --tts
	echo "${txtred} ${rev} ${bold} Enter your choice ${txtrst} "
	echo "${txtcyn}${bold} 1--- Facebook " 
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
	echo -e "${bold} ${txtred} Access Granted\n ${txtrst}"
	echo "Access Granted"|festival --tts
	echo -e "${txtcyn}${bold} Enter site \n ${txtrst}"
	read site
	`echo firefox $site`
	else
	echo -e "${bold} ${txtred} Access Denied\n ${txtrst}"
	echo "Access Denied"|festival --tts
	fi
$sleep
$sleep
$sleep
	internet
	;;
		7)  echo "${txtcyn}${bold} Enter new site
			${txtrst}" 
			read site
			`echo firefox $site`;;
		8)start;;	
	9)clear
	exi;;
*)
echo 
 echo "${txtred}${bold}INVALID OPTION ${txtrst}"
$sleep
$sleep
internet;;
esac
}
internet;;
6)hel(){
clear
$sleep
echo  "${txtgrn}   ${bold}   ${back}       ${undl}Welcome to Bingo Shell Help page  !!!${exundl}     ${txtrst}"
echo ""
echo "Welcome to Bingo Shell Help Page"|festival --tts
echo "${txtred} ${rev} ${bold} Enter 1 for command help and 2 for exit ${txtrst} "
read c
case $c in
1)
clear
$sleep
echo "${txtylw}${rev}${bold}Enter your command${txtrst}"
read cmd
clear
$sleep
man $cmd
hel;;
2)
exi;;
*)
clear
echo "${txtred}${bold}Invalid Option${txtrst}"
$sleep
$sleep
hel;;
esac
$sleep
$sleep
}
hel;;
7)ther(){
clear
echo "${txtylw}${bold}Weather conditions in your area is as follows :${txtrst}"
case $wea in
1)tus=`weather --id=VIDP`
echo -e "\n"
echo -e "${txtblu}${bold}$tus${txtrst}"
echo $tus|festival --tts
;;
2)tus=`weather --id=VOTR`
echo -e "\n"
echo -e "${txtblu}${bold}$tus${txtrst}"
echo $tus|festival --tts
;;
3)tus=`weather --id=VOHY`
echo -e "\n"
echo -e "${txtblu}${bold}$tus${txtrst}"
echo $tus|festival --tts
;;
4)tus=`weather --id=VOMM`
echo -e "\n"
echo -e "${txtblu}${bold}$tus${txtrst}"
echo $tus|festival --tts
;;
5)tus=`weather --id=VIAR`
echo -e "\n"
echo -e "${txtblu}${bold}$tus${txtrst}"
echo $tus|festival --tts
;;
6)tus=`weather --id=VECC`
echo -e "\n"
echo -e "${txtblu}${bold}$tus${txtrst}"
echo $tus|festival --tts
;;
7)tus=`weather --id=VIJP`
echo -e "\n"
echo -e "${txtblu}${bold}$tus${txtrst}"
echo $tus|festival --tts
;;
8)tus=`weather --id=VEPT`
echo -e "\n"
echo -e "${txtblu}${bold}$tus${txtrst}"
echo $tus|festival --tts
;;
esac
start
}
ther;;
bingo)clear
echo -e "${txtylw}${bold}Here are some of the comments by our users\n\n${txtrst}"
echo "Bingo"|festival --tts
cat comment.txt
$sleep
echo "Bingo"|festival --tts
$sleep
$sleep
echo "Bingo"|festival --tts
$sleep
$sleep
$sleep
start;;
8)x-terminal-emulator
$sleep
$sleep
start;;
9)gnome-terminal -x mplayer -playlist playlist -shuffle
$sleep
$sleep
clear
start;;
10)exi
;;
*) clear
echo "${txtred}${bold}Please Enter Correct option${txtrst}"
$sleep
$sleep
clear
start;;
esac
}
start
