<%@ page import="br.edu.unirn.tipos.StatusTarefa" %>
<div class="form-group">
    <label for="texto" class="col-sm-2 control-label">Texto</label>
    <div class="col-sm-10">
        <g:textArea name="texto" class="form-control" v-model="logTarefa.texto" readonly="{{somenteLeitura}}"/>
    </div>
</div>
<div class="form-group">
    <label for="usuarioLog" class="col-sm-2 control-label">Usuario Log</label>
    <div class="col-sm-10">
        <g:select name="usuarioLog" class="form-control" v-model="logTarefa.usuarioLog" noSelection="['':'-- Selecione --']"
                  from="${br.edu.unirn.Usuario.list()}" optionValue="email" optionKey="id"
                  disabled="{{somenteLeitura}}" readonly="{{somenteLeitura}}"/>
    </div>
</div>

<div class="form-group">
    <label for="statusTarefa" class="col-sm-2 control-label">Status Tarefa</label>
    <div class="col-sm-10">
        <g:select name="statusTarefa" class="form-control" v-model="logTarefa.statusTarefa" noSelection="['':'-- Selecione --']"
                  from="${br.edu.unirn.tipos.StatusTarefa.values()}" optionValue="descricao" keys="${br.edu.unirn.tipos.StatusTarefa?.values()*.name()}"
                  disabled="{{somenteLeitura}}" readonly="{{somenteLeitura}}"/>
    </div>
</div>
<div class="form-group">
    <label for="porcentagem" class="col-sm-2 control-label">Porcentagem</label>
    <div class="col-sm-10">
        <g:select name="porcentagem" from="${1..100}" class="form-control" v-model="logTarefa.porcentagem" noSelection="['-- Selecione --' : '0']"
                  disabled="{{somenteLeitura}}" readonly="{{somenteLeitura}}"/>
    </div>
</div>