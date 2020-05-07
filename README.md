# Malayalam-Programs
A repository containing all of my C++ files related to programs that deal with Malayalam.

This repo is split into the following components
================================================
1) pluralisation - as the name implies
  - mpp: the library which forms the core of the pluralisation module
  - server: A server implementation which uses the mpp library to respond to requests about:
    - whether a given input represents a plural or a singular noun
    - What the opposite form of a given input is
  - client
    - GraphMalPl - A graphical program that allows the user to send requests to a server
    - CmdMalPl - A command-line program that allows the user to send requests to a server
