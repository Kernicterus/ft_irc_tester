#-PATH FILES-#

SRC_DIR         = src
OBJ_DIR         = obj

#-SRC-#

SRCS            =   tester/main.cpp

SRCS_BOT        =   bot/Bot.cpp \
					bot/main.cpp \

OBJS            = $(SRCS:%.cpp=$(OBJ_DIR)/%.o)
OBJS_BOT        = $(SRCS_BOT:%.cpp=$(OBJ_DIR)/%.o)

#-UTILS-#

CXX             = c++
CXXFLAGS        = -Wall -Wextra -Werror -g
NAME            = ft_irc_tester
BOT             = ft_irc_bot
RM              = rm -f
RMR             = rm -rf

#-RULES-#

all:            $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
				@mkdir -p $(dir $@)
				$(CXX) $(CXXFLAGS) -c -o $@ $<

$(NAME):        $(addprefix $(OBJ_DIR)/, $(SRCS:.cpp=.o)) $(BOT)
				$(CXX) $(CXXFLAGS) $(addprefix $(OBJ_DIR)/, $(SRCS:.cpp=.o)) -o $(NAME)

$(BOT):         $(addprefix $(OBJ_DIR)/, $(SRCS_BOT:.cpp=.o))
				$(CXX) $(CXXFLAGS) $(addprefix $(OBJ_DIR)/, $(SRCS_BOT:.cpp=.o)) -o $(BOT)

bot:			$(BOT)

clean:
				$(RMR) $(OBJ_DIR)

fclean:			clean
				$(RM) $(NAME) $(BOT)

re:				fclean all

.PHONY:			all clean fclean re bot