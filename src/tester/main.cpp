#include <iostream>

int main(int argc, char **argv)
{
	try
	{
		if (argc != 6)
			throw std::runtime_error("Error : usage : ft_irc_tester <nb of instances> <server ip adress> <password> <port> <bot nickname>");
		if (atoi(argv[1]) < 1)
			throw std::runtime_error("Error : usage : instance must be a non null positive number");

		std::string command = "./ft_irc_bot";
		std::string prefix;
		command += " " + std::string(argv[2]); // ip
		command += " " + std::string(argv[3]); // pass
		command += " " + std::string(argv[4]); // port
		command += " " + std::string(argv[5]); // bot name
		prefix = command;
		for (int i = 0; i < atoi(argv[1]); i++)
		{
			command = prefix;
			command += std::to_string(i);
			command += " &";
			std::cout << "start command : " << command << std::endl;
			std::system(command.c_str());
		}
		return (0);
	}
	catch(const std::exception& e)
	{
		std::cerr << e.what() << '\n';
		return (1);
	}
}