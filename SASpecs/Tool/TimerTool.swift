//
//  TimerTool.swift
//  SASpecs
//
//  Created by Smalla on 2019/11/15.
//  Copyright © 2019 SASpecs. All rights reserved.
//

import Foundation

// 自定义定时器
class CustomTimer: NSObject {
    
    private var timer: Timer!
    public var timerFiredBlock: ((Any?)->())?
    
    public class func scheduledTimer(with timeInterval: TimeInterval, userInfo: Any?, repeats: Bool, actionBlock: @escaping ((Any?)->())) -> CustomTimer {
        
        let customTimer = CustomTimer()
        customTimer.timerFiredBlock = actionBlock
        
        customTimer.timer = Timer.scheduledTimer(timeInterval: timeInterval, target: customTimer, selector: #selector(timerFired(timer:)), userInfo: userInfo, repeats: repeats)
        return customTimer
    }
    
    @objc func timerFired(timer: Timer) {
        timerFiredBlock?(timer.userInfo)
    }
    
    /// 销毁定时器
    public func invalidate() {
        if let _ = timer {
            timer.invalidate()
            timer = nil
        }
        timerFiredBlock = nil
    }
    
    /// 暂停定时器
    public func pauseTimer() {
        timer.pauseTimer()
    }
    
    /// 重启定时器
    public func resumeTimer() {
        timer.resumeTimer()
    }
    
    /// 一段时间后重启定时器
    public func resumeTimerAfterTimeIntarval(timeIntarval: TimeInterval) {
        timer.resumeTimerAfterTimeIntarval(timeIntarval: timeIntarval)
    }
    
    deinit {
        debugPrintOnly("QNNTimer---------deinit")
    }
}

public extension Timer {
    //  定时器暂停
    func pauseTimer() {
        guard self.isValid else { return }
        self.fireDate = Date.distantFuture
    }
    
    //  定时器重启
    func resumeTimer() {
        guard self.isValid else { return }
        self.fireDate = Date.distantPast
    }
    
    //  一段时间之后重启定时器
    func resumeTimerAfterTimeIntarval(timeIntarval: TimeInterval) {
        guard self.isValid else { return }
        self.fireDate = Date(timeIntervalSinceNow: timeIntarval)
    }
}
