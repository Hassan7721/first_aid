import '../models/first_aid_guide.dart';

class LocalGuideDataSource {
  const LocalGuideDataSource();

  List<FirstAidGuide> getGuides() {
    return const [
      FirstAidGuide(
        id: 'burns',
        title: 'Burns',
        subtitle: 'First response to a thermal burn',
        icon: '🔥',
        category: 'Injuries',
        summary: 'Basic guidance for a thermal burn while arranging medical help when needed.',
        steps: [
          'Move away from the source of heat if it is safe to do so.',
          'Cool the burn under cool running water for 20 minutes.',
          'Remove jewellery or tight items near the area if they are not stuck to the skin.',
          'Cover loosely with a clean, non-fluffy dressing or cling film.',
        ],
        warning: 'Seek urgent medical help for serious, large, deep, chemical or electrical burns, or burns affecting the face, hands, feet or genitals. Do not use ice, butter or creams.',
      ),
      FirstAidGuide(
        id: 'bleeding',
        title: 'Severe Bleeding',
        subtitle: 'Respond to heavy bleeding',
        icon: '🩹',
        category: 'Injuries',
        summary: 'Heavy bleeding can be life-threatening and needs emergency help.',
        steps: [
          'Call your local emergency number immediately.',
          'If safe, use gloves or a barrier and apply firm, direct pressure with a clean dressing.',
          'Keep pressure on the wound while help is on the way.',
          'Keep the person still and warm, and monitor their responsiveness.',
        ],
        warning: 'Do not remove an object embedded in a wound. Do not delay emergency help. Follow the emergency dispatcher’s instructions.',
      ),
      FirstAidGuide(
        id: 'choking',
        title: 'Choking',
        subtitle: 'When someone cannot breathe normally',
        icon: '🫁',
        category: 'Breathing',
        summary: 'Choking can become life-threatening quickly.',
        steps: [
          'Ask if the person is choking and encourage them to cough if they can cough effectively.',
          'If they cannot speak, breathe or cough effectively, call emergency services or ask someone nearby to call.',
          'Follow the dispatcher’s instructions and use age-appropriate, recognized first-aid training.',
          'If the person becomes unresponsive, begin CPR if trained and follow dispatcher guidance.',
        ],
        warning: 'Choking procedures differ for adults, children and infants. This prototype does not replace practical first-aid training.',
      ),
      FirstAidGuide(
        id: 'fainting',
        title: 'Fainting',
        subtitle: 'If someone briefly loses consciousness',
        icon: '💫',
        category: 'Medical',
        summary: 'Help the person stay safe and check whether they recover promptly.',
        steps: [
          'Help the person lie flat and protect them from nearby hazards.',
          'Check whether they respond and are breathing normally.',
          'If they do not recover quickly, are injured, have chest pain, or have trouble breathing, call emergency services.',
          'Do not give food or drink until they are fully alert.',
        ],
        warning: 'If the person is unresponsive or not breathing normally, call emergency services immediately and follow dispatcher instructions.',
      ),
      FirstAidGuide(
        id: 'fracture',
        title: 'Suspected Fracture',
        subtitle: 'Support an injured limb',
        icon: '🦴',
        category: 'Injuries',
        summary: 'Avoid unnecessary movement and arrange medical assessment.',
        steps: [
          'Encourage the person to keep still and support the injured area in the position found.',
          'Do not try to straighten the limb or push a bone back into place.',
          'Apply a wrapped cold pack nearby if appropriate, without pressing on the injury.',
          'Seek medical help; call emergency services for severe injury or major trauma.',
        ],
        warning: 'Do not move someone with a suspected head, neck or back injury unless they are in immediate danger.',
      ),
      FirstAidGuide(
        id: 'allergy',
        title: 'Allergic Reaction',
        subtitle: 'Recognize a potentially severe reaction',
        icon: '🌿',
        category: 'Medical',
        summary: 'A severe allergic reaction is an emergency.',
        steps: [
          'Call emergency services immediately if there is breathing difficulty, throat or tongue swelling, collapse or rapidly worsening symptoms.',
          'If the person has their prescribed adrenaline auto-injector, help them use it according to their training and instructions.',
          'Have the person remain in a safe position and follow the emergency dispatcher’s guidance.',
          'If symptoms persist or worsen, tell the dispatcher immediately.',
        ],
        warning: 'Do not wait to see whether a severe reaction improves. Antihistamines are not a substitute for emergency treatment of anaphylaxis.',
      ),
    ];
  }
}
