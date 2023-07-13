let url_webpki = "";
var pki = new LacunaWebPKI();

function loginComCertificado() {
    pki.init(obterCertificado);
    
}

function obterCertificado(){
    pki.listCertificates().success(function (certs) {
        for (var i = 0; i < certs.length; i++) {
            var cert = certs[i];
            var thumbprint = cert.thumbprint;
            var subjectName = cert.subjectName;
            var issuerName = cert.issuerName;
            console.log("cert:",cert);
            console.log("thumbprint:",thumbprint);
            console.log("subjectName:",subjectName);
            console.log("issuerName:",issuerName);
        }
        if(certs.length==0){
            console.log("Nenhum certificado encontrado!");
        }
        if(certs.length==1){
            console.log("Só há um certificado!");
        }
    });
}