all: sumo-wrapper genInstanceFile RS getOriginalTL PSO VNS

sumo-wrapper: sumo-wrapper.cpp cInstance.cpp simpleXMLParser.cpp
	g++ -std=c++11 -o sumo-wrapper sumo-wrapper.cpp cInstance.cpp simpleXMLParser.cpp

genInstanceFile: genInstanceFile.cpp simpleXMLParser.cpp
	g++ -std=c++11 -o genInstanceFile genInstanceFile.cpp simpleXMLParser.cpp

RS: RS.cpp simpleXMLParser.cpp cInstance.cpp
	g++ -std=c++11 -o RS RS.cpp simpleXMLParser.cpp cInstance.cpp

getOriginalTL: getOriginalTL.cpp simpleXMLParser.cpp
	g++ -std=c++11 -o getOriginalTL getOriginalTL.cpp simpleXMLParser.cpp

PSO: PSO.cpp cInstance.cpp simpleXMLParser.cpp
	g++ -std=c++11 -o PSO PSO.cpp cInstance.cpp simpleXMLParser.cpp

VNS: VNS.cpp cInstance.cpp simpleXMLParser.cpp
	g++ -std=c++11 -o VNS VNS.cpp cInstance.cpp simpleXMLParser.cpp

clean:
	rm -f genInstanceFile getOriginalTL PSO RS sumo-wrapper VNS
