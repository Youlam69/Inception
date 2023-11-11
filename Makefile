all     :
			@ clear
			@ docker-compose -f  ./srcs/docker-compose.yml up -d --build

down    :
			@ clear
			@ docker-compose -f ./srcs/docker-compose.yml stop

fclean  :
			@ clear
			@ docker-compose -f ./srcs/docker-compose.yml down -v

.PHONY  :   all down    fclean