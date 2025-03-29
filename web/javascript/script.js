function proximaEtapa(etapaAtual, proximaEtapa) {
    document.getElementById(etapaAtual).classList.add('hidden');
    document.getElementById(proximaEtapa).classList.remove('hidden');
}