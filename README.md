[![Pharo 11 CI](https://github.com/OpenSmock/Pyramid/actions/workflows/Pharo11CI.yml/badge.svg)](https://github.com/OpenSmock/Pyramid/actions/workflows/Pharo11CI.yml)

# Pyramid

Pyramid is a User-Interface (UI) editor. 

Pyramid is a WYSIWYG application (What You See Is What You Get) in other terms it allows you to visually design the expected outcome.

Pyramid help you to produce final UI using Bloc library (and also Toplo).

## Installation

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

## Dependencies

- [Bloc-Serialization](https://github.com/OpenSmock/Bloc-Serialization)
- [Bloc](https://github.com/pharo-graphics/Bloc)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
