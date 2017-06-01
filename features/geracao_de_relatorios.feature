Feature: Geração de Relatórios
  As a usuário Administrador
  I want to gerar relatórios
  So that é possível fazer análise dos dados de modo mais simples.
  
  @c1
  Scenario: Produzir um relatório do total de resíduo(s), por Laboratório / Departamento / Resíduos entre datas específicas
    Given o sistema possui o departamento de "Engenharia Química" cadastrado
    And o sistema possui o laboratorio de "Processos Químicos" cadastrado no departamento de "Engenharia Química"
    And o sistema possui "500"kg de residuos cadastrados no laboratório de "Processos Químicos"
    When eu tento produzir o relatório total de resíduos cadastrados entre as datas "21/02/2017" e "24/03/2017" para o departamento de "Engenharia Química"
    Then o valor retornado pelo sistema será "500"kg

  @c2
  Scenario: Produzir um relatório mensal para um Departamento / Laboratório / Resíduos  específico.
    Given o sistema possui o departamento de "Engenharia Química" cadastrado
    And o sistema possui o laboratorio de "Processos Químicos" cadastrado no departamento de "Engenharia Química"
    And o sistema possui "300" kg de residuos cadastrados entre entre as datas "21/02/2017" e "21/03/2017" para o laboratorio de "Processos Químicos"
    And o sistema possui "700" kg de residuos cadastrados entre entre as datas "22/03/2017" e "24/03/2017" para o laboratorio de "Processos Químicos"
    When eu tento produzir o relatório total de resíduos cadastrados entre as datas "21/02/2017" e "21/03/2017" para o departamento de "Engenharia Química"
    Then o valor retornado pelo sistema será "300"kg
  
  @c3
  Scenario: Produzir relatório de resíduos por laboratório entre datas específicas.
    Given que eu estou na página "Geração de Relatórios"
    And a opção de gerar por "laboratório" está selecionada
    And eu vejo uma lista de "laboratórios" disponíveis no sistema.
    And  eu seleciono o "Laboratório de Processos Químicos"
    And no campo  "Data" eu vejo "21/02/2017" para início  e "24/03/2017" para final.
    When eu peço para "Gerar Relatório"
    And eu vou para a página de resumo de sistema
    Then eu devo visualizar a quantidade de resíduos produzidos, associado ao "Laboratório de Processos Químicos" entre as datas  "21/02/2017" e  "24/03/2017"
  
  @c4
  Scenario: Produzir relatório mensal do total de resíduo(s) para um departamento específico.
    Given  que eu estou na página "Geração de Relatórios"
    And  opção de gerar por "Departamento" está selecionada
    And eu vejo uma lista de "Departamento" disponíveis no sistema.
    And  eu seleciono o "Departamento de Engenharia Química"
    And no campo  "Data" eu vejo "21/02/2017" para início  e "21/03/2017" para final.
    When eu peço para gerar "Gerar Relatório"
    And vou para a página de resumo de sistema
    Then eu devo visualizar a quantidade de resíduos produzidos associado ao "Departamento de Engenharia Química" entre as datas  "21/02/2017" e  "21/03/2017"

  @c5
  Scenario: Produzir relatório de múltiplos Departamentos / Laboratórios / Resíduos
    Given o sistema possui o departamento de "Anatomia Humana" cadastrado com o resíduo "Hidróxido de Amônio" com quantidade total de "150"Kg
    And o sistema possui o departamento de "Biofísica Radiologia" cadastrado com o resíduo "Hidróxido de Amônio" com quantidade total de "25"Kg
    And o sistema possui o departamento de "Botânica" cadastrado com o resíduo "Sulfato de Amônio" com quantidade total de "100"Kg
    When eu tento gerar um relatório dos resíduos dos departamentos de "Anatomia Humana", "Biofísica Radiologia" e "Botânica"
    Then o sistema retorna o valor de "175"Kg para o resíduo "Hidróxido de Amônio"
    And o sistema retorna o valor de "100"Kg para o resíduo "Sulfato de Amônio"

  @c6
  Scenario: Produzir relatórios com filtros sobre Departamentos / Laboratórios
    Given o sistema possui o departamento de "Engenharia Química" cadastrado
    And o sistema possui o laboratorio de "Planejamento Avaliação e Síntese de Fármacos" cadastrado no departamento de "Engenharia Química"
    And o resíduo "Ácido Clorídrico" possui tipo como "Liquido Inorganico", peso como "300"Kg e código ONU como "2810" no laboratorio de "Planejamento Avaliação e Síntese de Fármacos"
    When eu tento produzir um relatório dos resíduos do laboratório de "Planejamento Avaliação e Síntese de Fármacos", com os filtros tipo e peso.
    Then o sistema retorna as informações "Liquido Inorganico" e "300"Kg para o resíduo "Ácido Clorídrico"
  
  @c7
  Scenario: Produzir relatório de Departamentos / Laboratórios sem resíduos associados
    Given que estou na página "reports/new"
    And a opção de gerar por "Departamentos" está selecionada
    And eu vejo uma lista de "Departamentos" disponíveis no sistema
    And eu vejo na lista o departamento de "Ciências Farmacêuticas" com nenhum resíduo
    When eu seleciono a opção departamento de "Ciências Farmacêuticas" na lista
    And peço para criar um novo relátorio
    Then eu vejo uma mensagem de notificação informando a inexistência de resíduos ligados ao departamento de "Ciências Farmacêuticas".
  
  @c8
  Scenario: Produzir relatório de Departamentos / Laboratórios / Resíduos
    Given que estou na página "reports/new"
    And a opção de gerar por "Laboratórios" está selecionada
    And eu vejo uma lista de "Laboratórios" disponíveis no sistema
    And o laboratório de "Bioprocessos e Bioprodutos" possui o resíduo "Ácido Nítrico" onde o estado físico é "Liquido Inorganico" e a quantidade total é "93"Kg
    When eu seleciono a opção "Bioprocessos e Bioprodutos"
    And seleciono os filtros "Kind" e "Total"
    And peço para criar um novo relátorio
    Then sou redirecionado para a página de resumo do sistema
    And vejo uma tabela com os dados sobre o "Laboratório de Bioprocessos e Bioprodutos" onde há 3 colunas, contendo nome, tipo e quantidade total dos resíduos
    And vejo na coluna nome "Ácido Nítrico", na coluna estado físico "Líquido" e na coluna quantidade total "93""Kg".