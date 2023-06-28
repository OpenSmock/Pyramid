[![Pharo 11 CI](https://github.com/OpenSmock/Pyramid/actions/workflows/Pharo11CI.yml/badge.svg)](https://github.com/OpenSmock/Pyramid/actions/workflows/Pharo11CI.yml)

# Pyramid

Pyramid is a User-Interface (UI) editor. 

Pyramid is a WYSIWYG application (What You See Is What You Get) in other terms it allows you to visually design the expected outcome.

Pyramid help you to produce final UI using Bloc library (and also Toplo).

## Installation

To install the latest version of pyramid, use the following script inside a Playground.

```st
[ Metacello new
	baseline: 'Pyramid';
	repository: 'github://OpenSmock/Pyramid:dev/src';
	onConflictUseIncoming;
	ignoreImage;
	load ]
		on: MCMergeOrLoadWarning
		do: [ :warning | warning load ]
```

## Examples

Examples can be found in the class `PyExamples`.

## Dependencies

- [Bloc-Serialization](https://github.com/OpenSmock/Bloc-Serialization)
- [Bloc](https://github.com/pharo-graphics/Bloc)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
