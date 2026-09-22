"""Cronómetro local de ensaio: Enter avança; Ctrl+C termina e guarda o registo."""
import argparse, json, time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('--duracao',type=int,choices=[35,45,55],default=45);args=p.parse_args()
root=Path(__file__).resolve().parents[1]
notas=json.loads((root/'guias/guiao.json').read_text())
registo=[];inicio=time.monotonic()
print(f'Ensaio de {args.duracao} minutos, incluindo 5 para perguntas. Enter ao terminar cada slide.')
try:
    for nota in notas:
        t=time.monotonic()
        input(f"{nota['n']:02d} · {nota['titulo']} | meta: {nota[f't{args.duracao}']} s ")
        real=round(time.monotonic()-t,1)
        registo.append({'slide':nota['n'],'segundos':real,'meta':nota[f't{args.duracao}']})
        print(f'  {real:.1f} s; acumulado {(time.monotonic()-inicio)/60:.1f} min')
    input('Perguntas: 5 minutos. Enter para terminar. ')
except KeyboardInterrupt:
    print('\nEnsaio interrompido; a guardar o registo parcial.')
finally:
    (root/'tmp').mkdir(exist_ok=True)
    (root/'tmp/ensaio.json').write_text(json.dumps({'duracao':args.duracao,'total_segundos':round(time.monotonic()-inicio,1),'slides':registo},ensure_ascii=False,indent=2))
