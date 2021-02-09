# Ai Photox


O Ai Photox foi desenvolvido em Flutter usando TensorFlow Lite **tflite** como biblioteca principal para trabalhar com inteligência artificial, então o **image_picker** foi usado para pegar as fotos da câmera e dos álbuns, o **mobx** e **flutter_modular** ambos foram usados para estruturar o gerenciamento de estado e injeção de dependência, também o **translator** foi usado para traduzir com base na API da GOOGLE alguns textos dentro do aplicativo. Algumas animações também foram utilizadas, como: **AnimatedContainer**, **animated_text_kit**, etc...

Agora falando da funcionalidade, o aplicativo tem um input para capturar alguma imagem através do image picker, essa imagem será salva no shared_controller com o mobx que está injetado dentro do Binds do app_module, permitindo que os outros módulos tenham acesso ao controller/state, a tela vai redirencionar o usuário para a página "guessing" onde a biblioteca **tflite** entra em ação para tentar advinhar o que possivelmente é aquela imagem baseada no modelo SDD MOBILENET baixado e armazenados no assets/models, nesse caso, eu baixei um modelo pronto ao invés de treiná-lo, quando é descoberto o que há na imagem, as possibilidades aparecem na tela e o usuário pode escolher certo ou errado, caso uma das opções seja coerente com o que está na imagem. 

<hr/>

The Ai Photox was developed on Flutter using TensorFlow Lite **tflite** as the main library to work with artificial intelligence, so the **image_picker** was used to grab the pictures from camera and albuns, the **mobx** and **flutter_modular** both were used to structure to state management and dependency injection, also the **translator** was used to translate based on GOOGLE API some texts inside of the app. Some animations were used too, like: **AnimatedContainer**, **animated_text_kit**, etc...

Now speaking of functionality, the application has an input to capture some image through the image picker, that image will be saved in the shared_controller with the mobx that is injected into the Binds of the app_module, allowing the other modules to have access to the controller/state, the screen will redirect the user to the "guessing" page where the **tflite** library comes into action to try to guess what possibly is that image based on the SDD MOBILENET model downloaded and stored in assets/models, in this case, I downloaded a ready model instead of training it, when it is discovered what is in the image, the possibilities appear on the screen and the user can choose right or wrong, if one of the options is consistent with what is in the image. 


## SCREENSHOTS - CAPTURAS DE TELA 
//


## LIBRARIES - BIBLIOTECAS

- flutter
- flutter_mobx
- mobx
- flutter_modular
- tflite
- image_picker
- animated_text_kit
- translator

<hr/>

Developed by,

Desenvolvido por,

lucascicco.
