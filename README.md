# Sistema Solar no Processing

## Onde você aplicou pushMatrix()/popMatrix() e por quê?
O pushMatrix() e popMatrix() foram usados dentro dos métodos display() (tanto das classes dos planetas como das luas). Isso isola as transformações de cada objeto, para que rotate e translate não afetem os outros elementos da tela. Assim, cada classe mantém suas próprias coordenadas.

## O que mudaria se invertêssemos rotate() e translate() no planeta ou na lua?
Inverter a ordem das transformações alteraria o comportamento do movimento. Atualmente, ao usar o rotate() antes de translate(), o objeto (planeta ou lua) orbita corretamente de acordo com o seu centro de referência. Caso seja invertido (o valor de rotate vai para o translate e o valor de translate vai para o rotate), o objeto perderia o efeito de órbita e apenas avançaria lentamenta em uma linha reta a partir do centro.

## Como garantiu que cada órbita é independente das demais?
Cada órbita é independente por causa da composição das classes (um planeta contém uma ou duas luas) e da separação da lógica no método update(). Além disso, com o uso de pushMatrix() e popMatrix() é certo que cada transformação ocorra na sua própria referência, sem interferir nos outros objetos.
