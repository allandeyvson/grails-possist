package br.edu.unirn

import grails.converters.JSON
import sun.rmi.runtime.Log

class LogTarefaController {

    static scaffold = LogTarefa


    def save (){
        params  << request.JSON

        LogTarefa logTarefa = new LogTarefa()
        bindData(logTarefa, params, [exclude:['tarefa']])
        Tarefa tarefa = Tarefa.get(params.get('tarefa').getAt('id'))
        logTarefa.setTarefa(tarefa)

        tarefa.setPorcentagem(logTarefa.getPorcentagem())
        tarefa.setStatusTarefa(logTarefa.getStatusTarefa())

        if(!logTarefa.save(flush: true) || !tarefa.save(flush:true)){
            logTarefa.errors.each {println it}
            render status: 500
            return
        }
        render status: 200
    }

    def list(){
        def retorno = []
        Tarefa tarefa = Tarefa.get(params.get('id'))

        LogTarefa.findByTarefa(tarefa)
        LogTarefa.where { tarefa.id == tarefa.getId()}.list().each {
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
