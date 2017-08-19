package br.edu.unirn

class AutenticacaoController {

    def index(){

    }

    def login() {
        Usuario usuario = Usuario.findByEmailAndSenha(params.email, "md5:"+params.senha?.encodeAsMD5())
        if(!usuario){
            flash.error = "Usuario nao encontrado!"
            render(view: "index")
            return
        }

        session.usuario = usuario
        redirect(controller: "index")
    }

    def logout(){
        session.invalidate()
        redirect(actionName:"index")
    }
}
