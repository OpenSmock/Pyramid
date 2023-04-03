# Pyramid
Pyramid is an user-interface builder for Bloc


## Installation

To install pyramid, use the following script inside a Playground.

```st
[ Metacello new
	baseline: 'Pyramid';
	repository: 'github://OpenSmock/Pyramid:main/src';
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
