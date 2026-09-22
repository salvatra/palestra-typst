"""Reconstrói todos os PDFs, pré-visualizações e ZIPs. Python 3 + Typst + pdftoppm."""
from pathlib import Path
import subprocess, shutil, zipfile, sys, os

ROOT=Path(__file__).resolve().parents[1]
os.chdir(ROOT)
OUT=ROOT/'output/pdf'; PRE=ROOT/'output/previews'; DIST=ROOT/'distribuicao'
for p in (OUT,PRE,DIST):p.mkdir(parents=True,exist_ok=True)
def run(*args):
    subprocess.run([str(a) for a in args],check=True)
def compile(source,name):
    run('typst','compile','--root',ROOT,'--font-path',ROOT/'recursos/fonts',source,OUT/f'{name}.pdf')
    print('PDF:',name,flush=True)
def preview(name,target):
    run('pdftoppm','-f','1','-singlefile','-scale-to','1200','-png',OUT/f'{name}.pdf',PRE/target)
for cmd in ('typst','pdftoppm'):
    if not shutil.which(cmd):sys.exit(f'Falta {cmd}. Consulte README.md.')
run(sys.executable,ROOT/'scripts/gerar-guiao.py')
for model in ('classico','engenharia','essencial'):
    compile(f'templates/{model}/main.typ',f'template-{model}')
    compile(f'templates/{model}/exemplo.typ',f'template-{model}-exemplo')
    preview(f'template-{model}-exemplo',model)
    shutil.copy(ROOT/'LICENSE',ROOT/f'templates/{model}/LICENSE')
for kind in ('cv','poster','ficha'):
    compile(f'exemplos/galeria/{kind}.typ',f'exemplo-{kind}')
    preview(f'exemplo-{kind}',kind)
compile('exemplos/cetz/main.typ','exemplo-cetz')
for n in range(1,5):
    src=ROOT/f'demonstracao/{n:02d}.typ'
    (ROOT/f'demonstracao/playground-{n:02d}.typ').write_text((ROOT/'demonstracao/base.typ').read_text()+'\n'+src.read_text().split('\n',1)[1])
    compile(src,f'demo-{n:02d}')
    preview(f'demo-{n:02d}',f'demo-{n:02d}')
    # Ampliação do conteúdo relevante, para a referência se ler no projetor.
    run('pdftoppm','-f','1','-singlefile','-r','144','-x','120',
        '-y','208' if n==3 else '110','-W','950','-H','340' if n==3 else '316',
        '-png',OUT/f'demo-{n:02d}.pdf',PRE/f'demo-{n:02d}-focus')
for source,name in [('apresentacao/main.typ','apresentacao'),('apresentacao/apoio.typ','slides-apoio'),('apresentacao/reserva.typ','demo-reserva'),('guias/guia-rapido.typ','guia-rapido'),('guias/guiao.typ','guiao-orador')]:
    compile(source,name)
preview('apresentacao','apresentacao')
for model in ('classico','engenharia','essencial'):
    folder=ROOT/f'templates/{model}'
    with zipfile.ZipFile(DIST/f'template-{model}.zip','w',zipfile.ZIP_DEFLATED) as z:
        for f in sorted(folder.rglob('*')):
            if f.is_file():z.write(f,f'{model}/{f.relative_to(folder)}')
        for pdf in (f'template-{model}',f'template-{model}-exemplo'):
            z.write(OUT/f'{pdf}.pdf',f'{model}/previsualizacoes/{pdf}.pdf')
with zipfile.ZipFile(DIST/'kit-completo.zip','w',zipfile.ZIP_DEFLATED) as z:
    for folder in ('apresentacao','demonstracao','exemplos','guias','recursos','templates','scripts','output'):
        for f in sorted((ROOT/folder).rglob('*')):
            if f.is_file() and '__pycache__' not in f.parts:
                z.write(f,f'palestra-typst/{f.relative_to(ROOT)}')
    for name in ('README.md','LICENSE','.gitignore'):
        z.write(ROOT/name,f'palestra-typst/{name}')
print('Concluído: 19 PDFs, três ZIPs de templates e kit completo.')
