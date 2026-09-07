# Tmux Cheatsheet

Prefijo por defecto: Ctrl+B

## Sesiones
tmux new -s nombre          # crear sesión con nombre
tmux ls                     # listar sesiones activas
tmux attach -t nombre       # reconectar a una sesión
Ctrl+B  D                   # desconectar (detach) sin cerrar la sesión
tmux kill-session -t nombre # cerrar una sesión

## Paneles (configurados en mi .tmux.conf)
Ctrl+B  |                   # dividir panel verticalmente
Ctrl+B  -                   # dividir panel horizontalmente
Ctrl+B  flecha              # moverse entre paneles
Ctrl+B  x                   # cerrar panel actual
Ctrl+B  z                   # maximizar/restaurar panel actual (zoom)

## Ventanas (tabs)
Ctrl+B  c                   # nueva ventana
Ctrl+B  n                   # siguiente ventana
Ctrl+B  p                   # ventana anterior
Ctrl+B  ,                   # renombrar ventana actual
Ctrl+B  número              # ir directo a la ventana N

## Copiar/pegar (modo mouse activado en mi config)
Ctrl+B  [                   # entrar en modo copia (navegar con flechas)
Espacio                     # empezar selección (dentro de modo copia)
Enter                       # copiar selección
Ctrl+B  ]                   # pegar
