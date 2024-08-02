# 🚀 Integrating Gemini into Your Flutter Application

Create gemini robot 💬 chat bot 🤖 with Flutter. Show some ❤️ and star ⭐ the repo if you liked it.

###### contact for work, mail: chunhthanhde.dev@gmail.com

<img src="assets/icons/icon.png" height="100px"  alt="logo"/>

![GitHub stars](https://img.shields.io/github/stars/ChunhThanhDe/Flutter_gemini_Chat?style=social)
![GitHub forks](https://img.shields.io/github/forks/ChunhThanhDe/Flutter_gemini_Chat?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/ChunhThanhDe/Flutter_gemini_Chat?style=social)

<a href="https://www.linkedin.com/in/chunhthanhde/">
<img src="https://img.shields.io/badge/Support-Recommend%2FEndorse%20me%20on%20Linkedin-blue?style=for-the-badge&logo=linkedin" alt="Support me on LinkedIn" />
</a>

<a href="https://www.buymeacoffee.com/chunhthanhde" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/yellow_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

## 📚 Overview

Integrate Google's Gemini AI into your Flutter app with ease using the `flutter_gemini` package. This guide will help you enhance your app's functionality by leveraging Gemini's advanced AI features, including multilingual support, image and audio processing, and Natural Language Processing (NLP).

## 🌟 Key Features of Gemini

- **Stream Generate Content**: Handle partial results with streaming without waiting for the complete response.
- **Text-only Input**: Complete and summarize texts using NLP.
- **Text-and-Image Input**: Use the gemini-pro-vision model for tasks involving both text and images.
- **Multi-Turn Conversations (Chat)**: Engage in dynamic conversations with follow-up questions.
- **Token Counting**: Convert information into floating-point numbers.
- **Model Info**: Retrieve details about the model, including version and input token limits.
- **EmbedContents and BatchEmbedContents**: Transform information into numerical arrays for learning.

## 🏁 Implementation Steps

1. **Obtain an API Key** 🔑
   Create an account at [Google Gemini](https://ai.google.dev/tutorials/setup).
   
    - Click on "Get API Key,"
   
      ![](media/steps/step1-1.webp)
   
    - select a Google Cloud project,
   
      ![](media/steps/step1-2.webp)
   
    - and generate your API key.
   
      ![](media/steps/step1-3.webp)
   
    - Save this key for later use.
   
      ![](media/steps/step1-4.webp)

2. **Add Dependency** 📦

   ![](media/steps/step2-1.webp)

    - Add the `flutter_gemini` package to your project by running:
      ```sh
      flutter pub add flutter_gemini
      ```

3. **Initialize Gemini** ⚙️
    - In your `main.dart` file, initialize the Gemini package with your API key:
      ```dart
      void main() {
        Gemini.init(apiKey: 'YOUR_API_KEY_HERE');
        runApp(const MyApp());
      }
      ```

4. **Create an Instance and Make Requests** 🤖
    - Use the following code to create an instance of `flutter_gemini` and handle text or image input:
      ```dart
      final _gemini = Gemini.instance;
      _gemini.textAndImage(
        text: 'Your query here',
        images: [imageFile.readAsBytesSync()],
      );
      ```

5. **Handle Responses** 🔍
    - Manage responses from Gemini with attributes such as `FinishReason` and `SafetyRating`:
      ```dart
      if (value?.finishReason != 'STOP') {
        setResponse(value?.output ?? "Invalid User Query");
      }
      if (value?.SafetyRating != 'HarmCategory') {
        setResponse(value?.candidates[0].safety_ratings);
      }
      ```

## 🚀 Demo

You can see the response from the gemini here:

<table>
<tr>
<td><img src="https://github.com/ChunhThanhDe/Flutter_gemini_Chat/blob/master/media/Screenshot_horizontal.jpg" height="300px"></td>
<td><img src="https://github.com/ChunhThanhDe/Flutter_gemini_Chat/blob/master/media/Screenshot_vertical.jpg" height="300px"></td>
</tr>
</table>

## 🎉 Benefits

- **Easy Integration**: Simplifies adding AI features with clear documentation.
- **Cross-Platform Compatibility**: Supports Android, iOS, web, macOS, and Windows from a single codebase.
- **Reduced Time to Market**: Speeds up the integration of AI features into your app.

## 🌟 Conclusion

Integrating Google Gemini into your Flutter app with the `flutter_gemini` package opens up new possibilities for enhancing user experience. Utilize Gemini's powerful AI capabilities to add multilingual support, process images and audio, and implement advanced chatbot functionality.

## 📚 References

- [flutter_gemini Package](https://pub.dev/packages/flutter_gemini)
- [GitHub Repository](https://github.com/ChunhThanhDe/Flutter_gemini_Chat)
- [Google AI](https://ai.google.dev/)

Feel free to like and share your thoughts in the comments if you found this guide helpful! 👍