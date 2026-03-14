# lex-cognitive-compass

**Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-agentic/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Maps cardinal directions to value axes (truth/utility/beauty/safety), tracks magnetic declination from cognitive biases, and provides true north calibration for aligned decision-making. Bearings represent directional assessments toward value axes; biases cause declination that skews bearings away from true north.

## Gem Info

- **Gem name**: `lex-cognitive-compass`
- **Version**: `0.1.0`
- **Module**: `Legion::Extensions::CognitiveCompass`
- **Ruby**: `>= 3.4`
- **License**: MIT

## File Structure

```
lib/legion/extensions/cognitive_compass/
  cognitive_compass.rb
  version.rb
  client.rb
  helpers/
    constants.rb
    compass_engine.rb
    bearing.rb
    magnetic_bias.rb
  runners/
    cognitive_compass.rb
```

## Key Constants

From `helpers/constants.rb`:

- `CARDINAL_DIRECTIONS` — `{ north: :truth, east: :utility, south: :beauty, west: :safety }`
- `INTERCARDINAL_DIRECTIONS` — `{ northeast: [:truth, :utility], southeast: [:utility, :beauty], southwest: [:beauty, :safety], northwest: [:safety, :truth] }`
- `BIAS_TYPES` — `%i[confirmation anchoring availability recency authority framing sunk_cost optimism]`
- `MAX_COMPASSES` = `50`, `MAX_BIASES` = `20`
- `DECLINATION_DECAY` = `0.02`, `CALIBRATION_BOOST` = `0.15`
- `ACCURACY_LABELS` — `0.8+` = `:precise`, `0.6` = `:reliable`, `0.4` = `:approximate`, `0.2` = `:drifting`, below = `:lost`
- `DECLINATION_LABELS` — `0.8+` = `:severe`, `0.6` = `:significant`, `0.4` = `:moderate`, `0.2` = `:mild`, below = `:negligible`

## Runners

All methods in `Runners::CognitiveCompass` (`extend self`):

- `take_bearing(direction:, context:, confidence: nil)` — records a directional assessment toward a value axis; returns `Bearing` with accuracy derived from confidence
- `register_bias(bias_type:, domain:, declination: nil, strength: nil)` — registers a cognitive bias that causes magnetic declination; validates against `BIAS_TYPES`
- `calibrate(bias_id:, amount: nil)` — reduces declination on a bias by `CALIBRATION_BOOST` (or custom amount); represents active bias correction
- `list_bearings(direction: nil)` — all bearings, optionally filtered by direction
- `list_biases` — all registered biases with current declination
- `compass_status` — full compass report: bearing distribution, total declination, true north alignment

## Helpers

- `CompassEngine` — manages bearings and biases. `compass_report` computes aggregate: directional distribution, average declination, calibration state.
- `Bearing` — directional assessment with `direction`, `context`, `confidence`, `accuracy`. `direction` must be a valid cardinal or intercardinal value.
- `MagneticBias` — cognitive bias with `bias_type`, `domain`, `declination`, `strength`. `calibrate!(amount)` reduces declination. `declination_label` classifies severity.

## Integration Points

- `lex-cognitive-blindspot` tracks unknown-unknowns; compass tracks known value misalignments (biases that are registered and measurable).
- `lex-tick` action selection phase can check compass bearing toward `:safety` and `:truth` before executing high-stakes decisions — bearings with low accuracy or high declination should trigger deliberate mode.
- `calibrate` can be called after a `lex-conflict` resolution event, representing bias reduction through adversarial challenge.

## Development Notes

- `CARDINAL_DIRECTIONS` maps direction symbols to value names — north=truth is the primary alignment axis. "True north" metaphor: an unbiased agent points north (toward truth) reliably.
- Intercardinal directions blend two value axes; callers use these for nuanced assessments (e.g., `northeast` = truth + utility balance).
- `MAX_BIASES = 20` is intentionally small — too many registered biases suggests the calibration model is incomplete; address biases, don't just log them.
- `DECLINATION_DECAY = 0.02` models natural bias reduction over time without active calibration (slow passive correction).
