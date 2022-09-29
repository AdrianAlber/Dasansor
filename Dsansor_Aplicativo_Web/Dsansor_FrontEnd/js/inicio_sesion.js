function ingresar(){

usuario = document.getElementById("usuario").value;
password =  document.getElementById("password").value;
if(document.getElementById("usuario").value=="adrian carbal" && document.getElementById("password").value=="123456"){
    window.location="formulario.html"; 
    
}else{
alert("verifique sus credenciales");


} 


}
