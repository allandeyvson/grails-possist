<%@ page import="br.edu.unirn.tipos.StatusTarefa" %>
<div class="form-group">
    <label for="titulo" class="col-sm-2 control-label">Titulo</label>
    <div class="col-sm-10">
        <g:textField name="titulo" class="form-control" v-model="tarefa.titulo" readonly="{{somenteLeitura}}"/>
    </div>
</div>
<div class="form-group">
    <label for="texto" class="col-sm-2 control-label">Texto</label>
    <div class="col-sm-10">
        <g:textArea name="texto" class="form-control" v-model="tarefa.texto" readonly="{{somenteLeitura}}"/>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-2 control-label">Usuario Abertura</label>
    <div class="col-sm-10">
            <label class="col-sm-2 control-label" v-if="!tarefa.id">${session?.usuario?.email}</label>
            <label class="col-sm-2 control-label" v-if="tarefa.id">{{tarefa.emailUsuarioAbertura}}</label>
    </div>
</div>
<div class="form-group">
    <label for="usuarioResponsavel" class="col-sm-2 control-label">Usuario Responsavel</label>
    <div class="col-sm-10">
        <g:select name="usuarioResponsavel" class="form-control" v-model="tarefa.usuarioResponsavel" noSelection="['':'-- Selecione --']"
                  from="${br.edu.unirn.Usuario.list()}" optionValue="email" optionKey="id" disabled="{{somenteLeitura}}" readonly="{{somenteLeitura}}"/>
    </div>
</div>
<div class="form-group">
    <label for="dataLimite" class="col-sm-2 control-label">Data Limite</label>
    <div class="col-sm-10">
        <g:textField name="dataLimite" class="form-control" placeholder="__/__/__" v-model="tarefa.dataLimite" readonly="{{somenteLeitura}}">
        </g:textField>
    </div>
</div>
<div class="form-group">
    <label for="tipoTarefa" class="col-sm-2 control-label">Tipo Tarefa</label>
    <div class="col-sm-10">
        <g:select name="tipoTarefa" class="form-control" v-model="tarefa.tipoTarefa" noSelection="['':'-- Selecione --']"
                  from="${br.edu.unirn.TipoTarefa.list()}" optionValue="descricao" optionKey="id" disabled="{{somenteLeitura}}" readonly="{{somenteLeitura}}"/>
    </div>
</div>
<div class="form-group">
    <label for="statusTarefa" class="col-sm-2 control-label">Status Tarefa</label>
    <div class="col-sm-10">
        <g:select name="statusTarefa" class="form-control" v-model="tarefa.statusTarefa" noSelection="['':'-- Selecione --']"
                  from="${br.edu.unirn.tipos.StatusTarefa.values()}" optionValue="descricao" keys="${br.edu.unirn.tipos.StatusTarefa?.values()*.name()}"
                  disabled="{{somenteLeitura}}" readonly="{{somenteLeitura}}"/>
    </div>
</div>
<div class="form-group">
    <label for="porcentagem" class="col-sm-2 control-label">Porcentagem</label>
    <div class="col-sm-10">
        %{--<g:field type="number" name="porcentagem" class="form-control" v-model="tarefa.porcentagem" readonly="{{somenteLeitura}}"/>--}%
        <g:select name="porcentagem" from="${0..100}" class="form-control" v-model="tarefa.porcentagem"
                  disabled="{{somenteLeitura}}" readonly="{{somenteLeitura}}"/>
    </div>
</div>