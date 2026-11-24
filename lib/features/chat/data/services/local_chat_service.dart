class LocalChatService {
  String getReply(String input) {
    final question = input.toLowerCase();

    if (question.contains('burn')) {
      return 'For a thermal burn, move away from the heat source if safe and cool the area under cool running water for 20 minutes. Do not use ice, butter or creams. Serious or large burns need urgent medical assessment.';
    }
    if (question.contains('bleed')) {
      return 'Heavy bleeding needs emergency help. Call your local emergency number and, if safe, apply firm direct pressure with a clean dressing. Do not remove an embedded object. Follow the dispatcher’s instructions.';
    }
    if (question.contains('chok')) {
      return 'Choking can become life-threatening. If the person cannot speak, breathe or cough effectively, get emergency help immediately and follow dispatcher instructions. Procedures differ by age.';
    }
    if (question.contains('faint')) {
      return 'Help the person lie flat and check whether they respond and breathe normally. If they do not recover quickly, are injured, or have concerning symptoms, contact emergency services.';
    }

    return 'This prototype has a limited local demo knowledge set, so I cannot safely answer that question yet. Check the First Aid Library and consult qualified first-aid guidance. If this is urgent, contact emergency services now.';
  }
}
