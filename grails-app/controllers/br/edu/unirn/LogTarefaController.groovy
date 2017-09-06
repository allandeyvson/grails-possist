package br.edu.unirn

import grails.converters.JSON

class LogTarefaController {

    static scaffold = LogTarefa


    def list(){
        def retorno = []

        LogTarefa.list().each {
            retorno.add([
                    id : it.id,
                    texto : it.texto,
                    porcentagem : it.porcentagem,
                    dateCreated: it.dateCreated.format("dd/MM/yyyy"),
                    status: it.statusTarefa.descricao,
                    usuarioLog : it.usuarioLog.email
            ])
        }

        render retorno as JSON
    }
}
