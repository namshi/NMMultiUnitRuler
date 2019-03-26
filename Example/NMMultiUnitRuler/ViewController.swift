//
//  ViewController.swift
//  NMMultiUnitRulerDemo
//
//  Created by Farshid Ghods on 12/29/16.
//  Copyright © 2016 Rekovery. All rights reserved.
//

import UIKit
import NMMultiUnitRuler


class ViewController: UIViewController, NMMultiUnitRulerDataSource, NMMultiUnitRulerDelegate {

    @IBOutlet weak var ruler: NMMultiUnitRuler?
    @IBOutlet weak var controlHConstraint: NSLayoutConstraint?
    @IBOutlet weak var colorSwitch: UISwitch?
    var backgroundColor: UIColor = UIColor(red: 0.22, green: 0.74, blue: 0.86, alpha: 1.0)

    @IBOutlet weak var directionSwitch: UISwitch?
    @IBOutlet weak var moreMarkersSwitch: UISwitch?

    var rangeStart = Measurement(value: 30.0, unit: UnitMass.kilograms)
    var rangeLength = Measurement(value: Double(90), unit: UnitMass.kilograms)

    var colorOverridesEnabled = false
    var moreMarkers = false
    var direction: NMLayerDirection = .horizontal

    var segments = Array<NMSegmentUnit>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorSwitch?.addTarget(self,
                                    action: #selector(ViewController.colorSwitchValueChanged(sender:)),
                                    for: .valueChanged)
        self.directionSwitch?.addTarget(self,
                                        action: #selector(ViewController.directionSwitchValueChanged(sender:)),
                                        for: .valueChanged)
        self.moreMarkersSwitch?.addTarget(self,
                                          action: #selector(ViewController.moreMarkersSwitchValueChanged(sender:)),
                                          for: .valueChanged)
        ruler?.direction = direction
        ruler?.tintColor = UIColor(red: 0.15, green: 0.18, blue: 0.48, alpha: 1.0)
        controlHConstraint?.constant = 200.0
        segments = self.createSegments()
        ruler?.delegate = self
        ruler?.dataSource = self

        let initialValue = (self.rangeForUnit(UnitMass.kilograms).location + self.rangeForUnit(UnitMass.kilograms).length) / 2
        ruler?.measurement = NSMeasurement(
            doubleValue: Double(initialValue),
            unit: UnitMass.kilograms)
        self.view.layoutSubviews()
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func createSegments() -> Array<NMSegmentUnit> {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.unitOptions = .providedUnit
        let kgSegment = NMSegmentUnit(name: "Kilograms", unit: UnitMass.kilograms, formatter: formatter)

        kgSegment.name = "Kilogram"
        kgSegment.unit = UnitMass.kilograms
        let kgMarkerTypeMax = NMRangeMarkerType(color: UIColor.white, size: CGSize(width: 1.0, height: 50.0), scale: 5.0)
        kgMarkerTypeMax.labelVisible = true
        kgSegment.markerTypes = [
            NMRangeMarkerType(color: UIColor.white, size: CGSize(width: 1.0, height: 35.0), scale: 0.5),
            NMRangeMarkerType(color: UIColor.white, size: CGSize(width: 1.0, height: 50.0), scale: 1.0)]

        let lbsSegment = NMSegmentUnit(name: "Pounds", unit: UnitMass.pounds, formatter: formatter)
        let lbsMarkerTypeMax = NMRangeMarkerType(color: UIColor.white, size: CGSize(width: 1.0, height: 50.0), scale: 10.0)

        lbsSegment.markerTypes = [
            NMRangeMarkerType(color: UIColor.white, size: CGSize(width: 1.0, height: 35.0), scale: 1.0)]

        if moreMarkers {
            kgSegment.markerTypes.append(kgMarkerTypeMax)
            lbsSegment.markerTypes.append(lbsMarkerTypeMax)
        }
        kgSegment.markerTypes.last?.labelVisible = true
        lbsSegment.markerTypes.last?.labelVisible = true
        return [kgSegment, lbsSegment]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func unitForSegmentAtIndex(index: Int) -> NMSegmentUnit {
        return segments[index]
    }
    var numberOfSegments: Int {
        get {
            return segments.count
        }
        set {
        }
    }

    func rangeForUnit(_ unit: Dimension) -> NMRange<Float> {
        let locationConverted = rangeStart.converted(to: unit as! UnitMass)
        let lengthConverted = rangeLength.converted(to: unit as! UnitMass)
        return NMRange<Float>(location: ceilf(Float(locationConverted.value)),
                              length: ceilf(Float(lengthConverted.value)))
    }

    func styleForUnit(_ unit: Dimension) -> NMSegmentUnitControlStyle {
        let style: NMSegmentUnitControlStyle = NMSegmentUnitControlStyle()
        style.scrollViewBackgroundColor = UIColor(red: 0.22, green: 0.74, blue: 0.86, alpha: 1.0)
        let range = self.rangeForUnit(unit)
        if unit == UnitMass.pounds {

            style.textFieldBackgroundColor = UIColor.clear
            // color override location:location+40% red , location+60%:location.100% green
        } else {
            style.textFieldBackgroundColor = UIColor.red
        }
        if (colorOverridesEnabled) {
            style.colorOverrides = [
                NMRange<Float>(location: range.location, length: 0.1 * (range.length)): UIColor.red,
                NMRange<Float>(location: range.location + 0.4 * (range.length), length: 0.2 * (range.length)): UIColor.green]
        }
        style.textFieldBackgroundColor = UIColor.clear
        style.textFieldTextColor = UIColor.white
        return style
    }

    func valueChanged(measurement: NSMeasurement) {
        print("value changed to \(measurement.doubleValue)")
    }

    @objc func colorSwitchValueChanged(sender: UISwitch) {
        colorOverridesEnabled = sender.isOn
        ruler?.refresh()
    }

    @objc func directionSwitchValueChanged(sender: UISwitch) {
        if sender.isOn {
            direction = .vertical
            controlHConstraint?.constant = 400
        } else {
            direction = .horizontal
            controlHConstraint?.constant = 200
        }
        ruler?.direction = direction
        ruler?.refresh()
        self.view.layoutSubviews()
    }

    @objc func moreMarkersSwitchValueChanged(sender: UISwitch) {
        moreMarkers = sender.isOn
        if moreMarkers {
            self.rangeLength = Measurement(value: Double(90), unit: UnitMass.kilograms)
        } else {
            self.rangeLength = Measurement(value: Double(130), unit: UnitMass.kilograms)
        }
        segments = self.createSegments()
        ruler?.refresh()
        self.view.layoutSubviews()
    }
}

