class Hostname {
  String urlBaseDev;
  String urlBaseProducao;
  int portBase;
  String portBaseProducao;
  String portBaseDev;

  Hostname getHostname() {
    Hostname _hostname = Hostname();
    // _hostname.urlBaseDev = "192.168.1.106";
    _hostname.urlBaseDev = "192.168.0.54";
    // _hostname.urlBaseDev = "172.20.10.5";
    // _hostname.urlBaseDev = "192.168.0.102";
    // _hostname.urlBaseProducao =
    //     "ec2-18-216-54-44.us-east-2.compute.amazonaws.com";
    _hostname.portBase = 8080;
    // _hostname.portBaseProducao = ':8080/delivery/api';
    _hostname.portBaseDev = ':8080/api';
    return _hostname;
  }

  //_hostname.urlBase = "ec2-18-216-54-44.us-east-2.compute.amazonaws.com";

//  ec2-18-216-54-44.us-east-2.compute.amazonaws.com:8080/delivery
}
