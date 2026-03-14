# lex-cognitive-compass

Cognitive compass LEX — internal directional sense for decision-making. Maps cardinal directions to value axes (truth/utility/beauty/safety), tracks magnetic declination from cognitive biases, and provides true north calibration for aligned decision-making.

## What It Does

Decision-making has a direction — toward truth, utility, beauty, or safety. This extension models an internal compass that takes bearings (directional assessments in context), registers cognitive biases that cause magnetic declination (pulling bearings away from true north), and supports active calibration (reducing bias-driven drift).

Eight bias types are modeled: confirmation, anchoring, availability, recency, authority, framing, sunk cost, and optimism. Intercardinal directions blend two value axes for nuanced assessments.

## Usage

```ruby
client = Legion::Extensions::CognitiveCompass::Client.new

client.take_bearing(direction: :north, context: 'fact-checking response accuracy', confidence: 0.8)
client.take_bearing(direction: :west, context: 'evaluating action safety', confidence: 0.7)

bias = client.register_bias(
  bias_type: :confirmation,
  domain: :reasoning,
  declination: 0.6
)

client.calibrate(bias_id: bias[:bias][:id])  # reduce declination
client.compass_status
```

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

## License

MIT
