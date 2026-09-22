"""Converte as notas editáveis em dados para o guião e para o cronómetro."""
from pathlib import Path
import json, re
ROOT = Path(__file__).resolve().parents[1]
records=[]
for block in (ROOT/'guias/notas.txt').read_text().strip().split('\n\n'):
    lines=block.splitlines(); n,t,title=lines[0].split('|',2)
    row={'n':int(n),'t45':int(t),'titulo':title}
    mapping={'OBJETIVO':'objetivo','FALA':'fala','TRANSIÇÃO':'transicao','INTERAÇÃO':'interacao','AÇÃO':'acao','CURTO':'curto','LONGO':'longo'}
    for line in lines[1:]:
        k,v=line.split(':',1);row[mapping[k]]=v.strip()
    records.append(row)
blocks=[(0,3,180,300),(3,6,120,180),(6,12,240,420),(12,13,240,420),(13,16,120,240),(16,20,180,300),(20,28,600,900),(28,32,120,240)]
for a,b,short,long in blocks:
    base=sum(r['t45'] for r in records[a:b])
    for k,target in [('t35',short),('t55',long)]:
        remaining=target
        for i,r in enumerate(records[a:b]):
            r[k]=round(r['t45']*target/base) if i<b-a-1 else remaining
            remaining-=r[k]
for mode,total in [(35,1800),(45,2400),(55,3000)]:
    cursor=0
    for r in records:
        r[f'inicio{mode}']=cursor;cursor+=r[f't{mode}'];r[f'fim{mode}']=cursor
    assert cursor==total,(mode,cursor)
(ROOT/'guias/guiao.json').write_text(json.dumps(records,ensure_ascii=False,indent=2)+'\n')
words=sum(len(re.findall(r'\S+',r['fala'])) for r in records)
print(f'{len(records)} slides; {words} palavras de fala sugerida; percursos de 30/40/50 min + 5 min de perguntas.')
