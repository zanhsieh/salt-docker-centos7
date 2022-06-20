{% macro msg(msg0, msg1) -%} 
test0_{{ msg0 }}:
   salt.function:
     - name: cmd.run
     - tgt: '*'
     - arg:
       - echo test0 {{ msg0 }} 
test1_{{ msg1 }}:
   salt.function:
     - name: cmd.run
     - tgt: '*'
     - arg:
       - echo test0 {{ msg1 }} 
{% endmacro -%}

{{ msg('000', '111') }}
