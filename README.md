[![License](https://img.shields.io/github/license/openSmock/Pyramid.svg)](./LICENSE)
[![Pharo 11 CI](https://github.com/OpenSmock/Pyramid/actions/workflows/Pharo11CI.yml/badge.svg)](https://github.com/OpenSmock/Pyramid/actions/workflows/Pharo11CI.yml)

# Pyramid

Pyramid is a User-Interface (UI) editor. 

![image](https://github.com/OpenSmock/Pyramid/assets/49183340/d5b6957d-1015-4726-94b5-58ad1e62cfc9)

Pyramid is a WYSIWYG application (What You See Is What You Get) in other terms it allows you to visually design the expected outcome.

Pyramid helps you to produce final UI using Bloc library (and also Toplo).

## <img src="/resources/puce.svg" width="75" height="75" align="bottom"> How to get Pyramid

You can load the last stable version of Pyramid or the development version. The Development version can provide the new incoming functionalities but can be unstable.

To install a version of Pyramid, use one of the following scripts inside a playground.

### Stable version

```st
Metacello new
	baseline: 'Pyramid';
	repository: 'github://OpenSmock/Pyramid:main/src';
	load
```

### Latest development version

```st
Metacello new
	baseline: 'Pyramid';
	repository: 'github://OpenSmock/Pyramid:dev/src';
	load
```

## <img src="/resources/puce.svg" width="75" height="75" align="bottom"> How to use Pyramid

### Create a new project

Open the Pyramid menu into Library and click `New Project`.

![image](https://github.com/OpenSmock/Pyramid/assets/49183340/09b28b8e-f2df-489b-8855-68141efa6bf3)

Then the project view appears in a new window.

![image](https://github.com/OpenSmock/Pyramid/assets/49183340/b4f988ff-62e1-452f-b409-75439c584878)

### Add and setup graphical elements

Use the create button to add graphical element in your project view.

https://github.com/OpenSmock/Pyramid/assets/49183340/a02db9ad-314a-4caf-884c-9da4da809293

### Save a project

Setup the project to store your view into a Class.

When your project is saved into a method, you can see the preview on the `Pyramid preview` tab.

https://github.com/OpenSmock/Pyramid/assets/49183340/eb70004b-cfb4-43a0-8759-27d3bac75fd0

### Edit a saved project

Use the `Pyramid preview` tab to edit an existing project.

https://github.com/OpenSmock/Pyramid/assets/49183340/c4a18e51-5fb5-412c-90d4-0638cadb6bff

### Test a project

Use the `Pyramid preview` tab to test an existing project.

https://github.com/OpenSmock/Pyramid/assets/49183340/12a916e5-06d1-426f-954c-2e4e911475e1

### Tips

To edit a `BlElement` instance or a `BlSpace` instance into Pyramid :

```st
element editWithPyramid.
space editWithPyramid.
```

You can edit in Pyramid an opened BlSpace with `F12` keyboard shortcut, for that open a BlElement with `openInNewSpaceWithPyramidShortcut`.

## <img src="/resources/puce.svg" width="75" height="75" align="bottom"> Dependencies

![image](https://github.com/OpenSmock/Pyramid/assets/34318678/099f25fc-74bd-477f-bef0-2ad7d47db10d)

- [Bloc](https://github.com/pharo-graphics/Bloc)
- [Alexandrie](https://github.com/pharo-graphics/Alexandrie)
- [Bloc-Serialization](https://github.com/OpenSmock/Bloc-Serialization)

## <img src="/resources/puce.svg" width="75" height="75" align="bottom"> License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
