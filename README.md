### Integrantes do grupo 

Vinícius Souza Freitas - 15491959

Ryan Diniz Pereira - 15590907

**Obs: os códigos estão localizados na pasta códigos em que a part 1 esta nas duas pasta que começão com counter.**

# Parte 1

Nesta parte foi construído um contador síncrono a partir de de flip-flops do tipo T (Toggle flip-flops), os quais só funcionam, como o nome sugere, quando estão ligados. Ja para o contador síncrono ele também é auto explicativo, a forma que ele conta é a seguinte: 

Assumindo que inicialmente todos os flip-flops foram setados para zero, para que não se tenha comportamento indefinido no contador, temos o seguinte comportamento: dada uma saída Qns ela só mudara seu estado quando todas as saídas com n < ns estiverem altas, se não ele mantém o valor que tinha antes e como cada um dos flip-flops é controlado pela rising edge do clock temos um contador com base no clock.

Esse comportamento é evidenciado na imagem a seguir:

<img src='./Images/Clock_test.png'>

Essa imagem também é a simulação que que fizemos no ModelSim para comprovar o funcionamento do contador de 8 bits.

Agora compilando no Quartus para contarmos a quantidade de elementos lógicos que serão implementados na própria FPGA

<img src='./Images/better_rtl_part1.jpg'>

A imagem não esta em uma qualidade muito boa, porém ela é mais visível na pasta "Images".

A implementação na FPGA é da seguinte forma, para cada T flip-flop sera utilizado um flip-flop rising edge e dois MUX, como se tem 8 T flip-flops temos 24 elementos lógicos, somando as portas and temos 31 elementos lógicos para implementar o contador de 8 bits.

<img src='./Images/part1.gif'>

Este é o circuito funcionando na FPGA, obviamente não fora testado até valores muito grandes se não o botão quebraria, e a paciência se esgotaria.

Agora, comparando o circuito do exercício com o de quatro bits que seria implementado na fpga.

<img src='./Images/rtl_viwer_4bits.jpg'>

É visível pela imagem que não há diferenças grandes além da forma na qual as conexões foram desenhadas, entretanto é notável de que a FPGA não implementou um elemento lógico para o T flip-flop e consequentemente teve de "criar" cada um com dois MUX.

### Código

O código desta parte foi implementado da mesma forma que fora descrita no exercício instaciando cada um dos componentes para cada uns dos T flip-flops, o código também é separado em partes com o display e partes sem o display.

# Parte 2

Maneira que fora implementada em VHDL, é importante notar que desta vez em vez de fazer manualmente cada uma das saídas foi utilizado do STD_LOGIC_VECTOR

```vhdl
if (rising_edge(Clock)) then
            if (Clear_all = '1') then
                save_counter <= "0000000000000000";
            elsif (Enable = '1') then
                --é necessario usar std logic unsigned para somar
                save_counter <= save_counter + 1;
            else
                save_counter <= save_counter;
        end if;
end if;
```

O que obtemos no RTL viewer a partir deste código em vhdl:

<img src='./Images/rtl_viwer_part2.jpg'>

A maior diferença no design deste circuito em relação ao da parte anterior é de que possuímos um elemento lógico de soma para cada um dos bits do contador.

<img src='./Images/16bit_counter.gif'>

# Parte 3

Para esta parte foi utilizado a mesma ideia do contador anterior, porém agora com um grande contador que contara até um segundo e outro pequeno contador que contara até 9 cada vez que se passa um segundo. O grande contador for implementado da seguinte forma: Como o clock da fpga é 50Mhz significa que se passa 1 segundo a cada 50 000 000 de ticks no clock logo se contarmos até 50 milhões aproximadamente um segundo tera passado. Agora, para o pequeno clock, ele aumenta seu valor em um cada vez que o grande contador conta 50 milhões até o numero nove.

O seguinte código em VHDL foi usado para implementar este comportamento:

```vhdl
if (rising_edge(Clock)) then
    if (Clear_all = '1') then
        save_counter <= "00000000000000000000000000";
        display_counter <= "0000";
    elsif (Enable = '1') then
        --é necessario usar std logic unsigned para somar
        save_counter <= save_counter + 1;
        if (save_counter = "10111110101111000010000000") then
            if (display_counter = "1001") then
                display_counter <= "0000";
                save_counter <= "00000000000000000000000000";
            else 
                display_counter <= display_counter + 1;
                save_counter <= "00000000000000000000000000";
            end if;
        end if;	
    else
        save_counter <= save_counter;
end if;
```

<img src='./Images/1sec_counter.gif'>

# Parte 4

Esta parte foi implementada da mesma forma em que foi descrita no enunciado, em que o contador de 2 bits representa o estado em que as letras estão posicionadas e esse estado muda para o próximo a cada um segundo.

O seguinte código em VHDL descreve esse comportamento:

```vhdl
if (rising_edge(Clock)) then
    if (Clear_all = '1') then
        save_counter <= "00000000000000000000000000";
        display_counter <= "00";
    elsif (Enable = '1') then
        --é necessario usar std logic unsigned para somar
        save_counter <= save_counter + 1;
        if (save_counter = "10111110101111000010000000") then
            display_counter <= display_counter + 1;
            save_counter <= "00000000000000000000000000";
        end if;	
    else
        save_counter <= save_counter;
end if;
```

Na própria unidade do display é tratada cada um dos estados

```vhdl
case input_disp is
    --"0000001" e zero 0
    --"0110000" e E 
    --"1000010" e D                  -e      -0
    when "00" => out_disp <= "100001001100000000001";     
    when "01" => out_disp <= "011000000000011000010";
    when "10" => out_disp <= "000000110000100110000";
    when "11" => out_disp <= "100001001100000000001";
    when others => out_disp <= "000000000000000000000";
    end case;
end process;
```
<img src='./Images/implace_deo.gif'>

# Parte 5

A mesma lógica da parte 4 e do enunciado. Porém em vez de chegar em todos os valores possíveis de 3 bits quando o estado do contador chega em 101 ele retorna para 0 de forma a fazer um loop perfeito.

```vhdl
    if (rising_edge(Clock)) then
        if (Clear_all = '1') then
            save_counter <= "00000000000000000000000000";
            display_counter <= "000";
        elsif (Enable = '1') then
            --é necessario usar std logic unsigned para somar
            save_counter <= save_counter + 1;
            if (save_counter = "10111110101111000010000000") then
                if (display_counter = "101") then
                    display_counter <= "000";
                    save_counter <= "00000000000000000000000000";
                else
                    display_counter <= display_counter + 1;
                    save_counter <= "00000000000000000000000000";
                end if;
            end if;	
        else
            save_counter <= save_counter;
    end if;
end if;
```

Display

```vhdl
case input_disp is
    --"0000001" e zero 0
    --"0110000" e E 
    --"1000010" e D  
    --"1111111" e Nada
    --"100001001100000000001" dEo
    --"10000100110000" dE
    --"01100000000001" Eo
    when "000" => out_disp <= "111111111111111111111100001001100000000001";     
    when "001" => out_disp <= "111111111111111000010011000000000011111111";
    when "010" => out_disp <= "111111110000100110000000000111111111111111";
    when "011" => out_disp <= "100001001100000000001111111111111111111111";
    when "100" => out_disp <= "011000000000011111111111111111111111000010";
    when "101" => out_disp <= "000000111111111111111111111110000100110000";
    when others => out_disp <= "000000000000000000000000000000000000000000";
end case;
```

<img src='./Images/moving_deo.gif'>